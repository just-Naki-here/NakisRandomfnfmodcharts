#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

void mainImage()
{
	float mosaicRadius = 16.0;	// 马赛克半径(像素为单位)

    // 利用 x / s * s的方式，将值划块
    vec2 mosaicCoord = floor(fragCoord / mosaicRadius) * mosaicRadius;
    vec2 uv = mosaicCoord/iResolution.xy;
	fragColor = texture(iChannel0, uv);
    
    vec2 pixelOffset = fragCoord - mosaicCoord;
    vec2 center = vec2(mosaicRadius / 2.0);// 每个小块的中心点
    float len = length(center - pixelOffset);// 当前像素距离每个小块中心点的长度
    float circle = smoothstep(-2.0, 0.0, len-center.x);
    fragColor = fragColor * (1.0 - circle);
    //fragColor = vec4(vec3(circle), 1.0);
}