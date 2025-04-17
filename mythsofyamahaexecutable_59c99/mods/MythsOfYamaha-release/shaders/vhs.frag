// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel
// honestly goated tool

#pragma header
#extension GL_EXT_gpu_shader4 : enable

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define uv openfl_TextureCoordv.xy
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

#define PI 3.141592654f

vec3 RGB_to_YIQ(vec3 RGB)
{
    return mat3
    (
        0.299f, 0.587f, 0.114f,
        0.596f, -0.275f, -0.321f,
        0.212f, -0.523f, 0.311f
    ) * RGB;
}

vec3 YIQ_to_RGB(vec3 YIQ)
{
    return mat3
    (
        1.f, 0.956f, 0.619f,
        1.f, -0.272f, -0.647f,
        1.f, -1.106f, 1.703f
    ) * YIQ;
}

// Converts color from RGB to YIQ, blur the I and Q, then apply a dot crawl effect
vec3 VHS_effect(vec2 fragCoord, float color_fuckery)
{
    vec2    IQ = vec2(0,0),
            blur_size = vec2(16, 4),
            focal_point = blur_size * 0.5f;
    
    float   smear_factor = blur_size.x * blur_size.y;
    
    vec2    UV_Y = fragCoord / iResolution.xy;
    
    // IQ blur
    for (int i = 0; i < int(smear_factor); i++)
    {
        vec2 uv_prime = vec2
        (
            (fragCoord.x + float(i % int(blur_size.x)) - focal_point.x) / iResolution.x,
            (fragCoord.y + float(i / int(blur_size.y)) - focal_point.y) / iResolution.y
        );
        IQ += RGB_to_YIQ(texture(iChannel0, uv_prime).xyz).yz;
    }
    IQ /= smear_factor;
    
    vec3 color = vec3
    (
        RGB_to_YIQ(texture(iChannel0, UV_Y).xyz).r,
        IQ * (1.f + color_fuckery)
    );
    
    // NTSC Dot Crawl
    color.x += (IQ.x*sin((fragCoord.x))) *
               (IQ.y*sin( fragCoord.y * PI * 0.5f));
    
    color = YIQ_to_RGB(color);
    
    return color;
}



void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    //fragColor = vec4(vec3(sin(fragCoord.x)), texture(iChannel0, uv).a);
    fragColor = vec4(VHS_effect(fragCoord, 0.2f),texture(iChannel0, uv).a);
    //fragColor = texture(iChannel0, fragCoord / iResolution.xy);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}