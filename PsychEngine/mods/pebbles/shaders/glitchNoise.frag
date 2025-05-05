#pragma header

uniform float iTime;
uniform vec2 resolution;
uniform float alpha; // NEW: adjustable transparency

float rand(vec2 co) {
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main() {
    vec2 uv = openfl_TextureCoordv;

    // Color channel glitch offset
    float offset = 0.005 * sin(iTime * 10.0);
    vec4 r = texture2D(bitmap, uv + vec2(offset, 0.0));
    vec4 g = texture2D(bitmap, uv);
    vec4 b = texture2D(bitmap, uv - vec2(offset, 0.0));
    vec4 glitchColor = vec4(r.r, g.g, b.b, 1.0);

    // Noise overlay
    float noise = rand(uv * iTime * 1000.0);
    vec3 noiseColor = vec3(noise);

    // Mix glitch and noise
    vec3 finalColor = mix(glitchColor.rgb, noiseColor, 0.15);

    // Apply transparency via alpha uniform
    gl_FragColor = vec4(finalColor, alpha);
}
