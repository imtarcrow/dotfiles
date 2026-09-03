
// Code taken from https://github.com/sahaj-b/ghostty-cursor-shaders
// Modified by ChatGPT to fix up some problems with the original rendering
// and improve a few parts of the code

const float DURATION = 0.15;
const float TRAIL_SIZE = 0.80;
const float THRESHOLD_MIN_DISTANCE = 1.5;
const float BLUR = 2.0;
const float PI = 3.14159265359;

vec3 sRGBToLinear(vec3 c) {
    return mix(c / 12.92, pow((c + 0.055) / 1.055, vec3(2.4)), step(vec3(0.04045), c));
}

vec4 TRAIL_COLOR = vec4(
        sRGBToLinear(iCurrentCursorColor.rgb),
        iCurrentCursorColor.a
    );

float ease(float x) {
    return sin((clamp(x, 0.0, 1.0) * PI) / 2.0);
}

vec2 normalize(vec2 value, float isPosition) {
    return (value * 2.0 - iResolution.xy * isPosition) / iResolution.y;
}

float aaWidth() {
    return 2.0 * BLUR / iResolution.y;
}

float antialiasing(float d) {
    return 1.0 - smoothstep(0.0, aaWidth(), d);
}

float sdBox(vec2 p, vec2 center, vec2 halfSize) {
    vec2 d = abs(p - center) - halfSize;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

float sdConvexQuad(vec2 p, vec2 a, vec2 b, vec2 c, vec2 d) {
    vec2 e0 = b - a;
    vec2 e1 = c - b;
    vec2 e2 = d - c;
    vec2 e3 = a - d;

    vec2 w0 = p - a;
    vec2 w1 = p - b;
    vec2 w2 = p - c;
    vec2 w3 = p - d;

    float h0 = clamp(dot(w0, e0) / max(dot(e0, e0), 1e-8), 0.0, 1.0);
    float h1 = clamp(dot(w1, e1) / max(dot(e1, e1), 1e-8), 0.0, 1.0);
    float h2 = clamp(dot(w2, e2) / max(dot(e2, e2), 1e-8), 0.0, 1.0);
    float h3 = clamp(dot(w3, e3) / max(dot(e3, e3), 1e-8), 0.0, 1.0);

    float d0 = dot(p - (a + e0 * h0), p - (a + e0 * h0));
    float d1 = dot(p - (b + e1 * h1), p - (b + e1 * h1));
    float d2 = dot(p - (c + e2 * h2), p - (c + e2 * h2));
    float d3 = dot(p - (d + e3 * h3), p - (d + e3 * h3));

    float dist = sqrt(min(min(d0, d1), min(d2, d3)));

    float s0 = e0.x * w0.y - e0.y * w0.x;
    float s1 = e1.x * w1.y - e1.y * w1.x;
    float s2 = e2.x * w2.y - e2.y * w2.x;
    float s3 = e3.x * w3.y - e3.y * w3.x;

    float positive = step(0.0, s0) * step(0.0, s1) * step(0.0, s2) * step(0.0, s3);
    float negative = step(s0, 0.0) * step(s1, 0.0) * step(s2, 0.0) * step(s3, 0.0);

    return mix(dist, -dist, max(positive, negative));
}

float getDurationFromDot(float dotValue, float lead, float side, float trail) {
    float isLead = step(0.5, dotValue);
    float isSide = step(-0.5, dotValue) * (1.0 - isLead);
    return mix(mix(trail, side, isSide), lead, isLead);
}

vec2 cursorCenter(vec4 cursor) {
    return vec2(cursor.x + cursor.z * 0.5, cursor.y - cursor.w * 0.5);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    #if !defined(WEB)
    fragColor = texture(iChannel0, fragCoord.xy / iResolution.xy);
    #endif

    vec2 p = normalize(fragCoord, 1.0);

    vec4 current = vec4(
            normalize(iCurrentCursor.xy, 1.0),
            normalize(iCurrentCursor.zw, 0.0)
        );

    vec4 previous = vec4(
            normalize(iPreviousCursor.xy, 1.0),
            normalize(iPreviousCursor.zw, 0.0)
        );

    vec2 currentCenter = cursorCenter(current);
    vec2 previousCenter = cursorCenter(previous);

    vec2 movement = currentCenter - previousCenter;
    float movementLength = length(movement);
    float movementEpsilon = 1.0 / iResolution.y;

    if (movementLength <= movementEpsilon) {
        return;
    }

    float baseProgress = iTime - iTimeCursorChange;

    if (baseProgress >= DURATION) {
        return;
    }

    vec2 delta = abs(movement);
    float straightThreshold = 0.001;
    float horizontal = step(delta.y, straightThreshold);
    float vertical = step(delta.x, straightThreshold);
    float straight = max(horizontal, vertical);

    vec2 dir = movement / max(movementLength, 1e-8);
    vec2 directionSign = sign(movement);

    // Current cursor corners.
    vec2 currentTL = vec2(current.x, current.y);
    vec2 currentTR = vec2(current.x + current.z, current.y);
    vec2 currentBR = vec2(current.x + current.z, current.y - current.w);
    vec2 currentBL = vec2(current.x, current.y - current.w);

    // Previous cursor corners.
    vec2 previousTL = vec2(previous.x, previous.y);
    vec2 previousTR = vec2(previous.x + previous.z, previous.y);
    vec2 previousBR = vec2(previous.x + previous.z, previous.y - previous.w);
    vec2 previousBL = vec2(previous.x, previous.y - previous.w);

    // Leading/trailing timing.
    float durationTrail = DURATION;
    float durationLead = DURATION * (1.0 - TRAIL_SIZE);
    float durationSide = (durationLead + durationTrail) * 0.5;

    // Classify each corner against movement direction.
    float dotTL = dot(vec2(-1.0, 1.0), directionSign);
    float dotTR = dot(vec2(1.0, 1.0), directionSign);
    float dotBL = dot(vec2(-1.0, -1.0), directionSign);
    float dotBR = dot(vec2(1.0, -1.0), directionSign);

    float durationTL = getDurationFromDot(dotTL, durationLead, durationSide, durationTrail);
    float durationTR = getDurationFromDot(dotTR, durationLead, durationSide, durationTrail);
    float durationBL = getDurationFromDot(dotBL, durationLead, durationSide, durationTrail);
    float durationBR = getDurationFromDot(dotBR, durationLead, durationSide, durationTrail);

    // For horizontal movement, keep the cursor-facing vertical rail together.
    float movingRight = step(0.5, directionSign.x);
    float movingLeft = step(0.5, -directionSign.x);

    float rightRailDot = (dotTR + dotBR) * 0.5;
    float leftRailDot = (dotTL + dotBL) * 0.5;

    float rightRailDuration = getDurationFromDot(
            rightRailDot,
            durationLead,
            durationSide,
            durationTrail
        );

    float leftRailDuration = getDurationFromDot(
            leftRailDot,
            durationLead,
            durationSide,
            durationTrail
        );

    durationTL = mix(durationTL, leftRailDuration, movingLeft);
    durationBL = mix(durationBL, leftRailDuration, movingLeft);
    durationTR = mix(durationTR, rightRailDuration, movingRight);
    durationBR = mix(durationBR, rightRailDuration, movingRight);

    // Independent corner animation.
    float progressTL = ease(baseProgress / max(durationTL, 1e-6));
    float progressTR = ease(baseProgress / max(durationTR, 1e-6));
    float progressBL = ease(baseProgress / max(durationBL, 1e-6));
    float progressBR = ease(baseProgress / max(durationBR, 1e-6));

    vec2 tl = mix(previousTL, currentTL, progressTL);
    vec2 tr = mix(previousTR, currentTR, progressTR);
    vec2 br = mix(previousBR, currentBR, progressBR);
    vec2 bl = mix(previousBL, currentBL, progressBL);

    // For straight movement, use a clean rectangular smear.
    vec2 animatedMin = min(
            min(tl, tr),
            min(br, bl)
        );

    vec2 animatedMax = max(
            max(tl, tr),
            max(br, bl)
        );

    vec2 animatedCenter = (animatedMin + animatedMax) * 0.5;
    vec2 animatedSize = animatedMax - animatedMin;

    float diagonalSdf = sdConvexQuad(p, tl, tr, br, bl);
    float straightSdf = sdBox(p, animatedCenter, animatedSize * 0.5);

    float trailSdf = mix(diagonalSdf, straightSdf, straight);

    // Don't show trails for tiny cursor movements.
    float minDistance = current.w * THRESHOLD_MIN_DISTANCE;
    float trailVisible = step(minDistance, movementLength);

    float alpha = antialiasing(trailSdf) * trailVisible;

    // Keep the actual cursor visible on top of the trail.
    float cursorSdf = sdBox(
            p,
            currentCenter,
            current.zw * 0.5
        );

    float cursorMask = smoothstep(
            -aaWidth() * 0.75,
            aaWidth() * 0.25,
            cursorSdf
        );

    alpha *= cursorMask;

    fragColor = mix(fragColor, TRAIL_COLOR, alpha);
}
