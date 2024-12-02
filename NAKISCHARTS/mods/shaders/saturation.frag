#pragma header

vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

uniform float size = 1.0;

//by chatGPT lmao
void main()
{
    vec2 xy = fragCoord.xy / iResolution.xy;
    vec4 originalColor = texture(iChannel0, xy);
    
    float gray = dot(originalColor.rgb, vec3(0.2126, 0.7152, 0.0722));
    vec3 sepiaColor = vec3(gray, gray, gray);
    vec3 finalColor = mix(originalColor.rgb, sepiaColor, size);
    
    fragColor = vec4(finalColor, originalColor.a);
}