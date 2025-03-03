#pragma header
uniform float iTime; // make sure iTime is declared as a uniform
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main
#define time iTime
//SHADERTOY PORT FIX

void mainImage()
{
    // Get normalized pixel coordinates (from 0 to 1)
    vec2 fragCoord = openfl_TextureCoordv * openfl_TextureSize;
    vec2 iResolution = openfl_TextureSize;
    vec2 uv = fragCoord / iResolution.xy; // Normalize fragment coordinates

    const float timeMulti = 0.03;
    const float xSpeed = -2.0;
    const float ySpeed = 0.0;

    float time = iTime * timeMulti;

    // Calculate x and y coordinates
    float xCoord = floor(fragCoord.x + time * xSpeed * iResolution.x);
    float yCoord = floor(fragCoord.y + time * ySpeed * iResolution.y);

    // Create coordinates wrapping around the resolution
    vec2 coord = vec2(xCoord, yCoord);
    coord = mod(coord, iResolution.xy);

    // Calculate the final uv coordinates
    uv = coord / iResolution.xy;

    // Sample the texture to get the color value
    float col = texture(iChannel0, uv).x;

    vec3 color = vec3(col);
    
    // Combine color for output
    fragColor = vec4(color, 1.0) * texture(iChannel0, uv) + texture(iChannel0, uv);
}