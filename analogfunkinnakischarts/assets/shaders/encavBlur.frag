#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
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

/*
	Transverse Chromatic Aberration

	Based on https://github.com/FlexMonkey/Filterpedia/blob/7a0d4a7070894eb77b9d1831f689f9d8765c12ca/Filterpedia/customFilters/TransverseChromaticAberration.swift

	Simon Gladman | http://flexmonkey.blogspot.co.uk | September 2017
*/

int sampleCount = 50;
uniform float blur = 0.0;
float falloff = 3.0; 

// use iChannel0 for video, iChannel1 for test grid
#define INPUT iChannel0

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 destCoord = fragCoord.xy / iResolution.xy;

    vec2 direction = normalize(destCoord - 0.5); 
    vec2 velocity = direction * blur * pow(length(destCoord - 0.5), falloff);
	float inverseSampleCount = 1.0 / float(sampleCount); 
    
    mat3x2 increments = mat3x2(velocity * 1.0 * inverseSampleCount,
                               velocity * 2.0 * inverseSampleCount,
                               velocity * 4.0 * inverseSampleCount);

    vec3 accumulator = vec3(0);
    mat3x2 offsets = mat3x2(0); 
    
    for (int i = 0; i < sampleCount; i++) {
        accumulator.r += texture(INPUT, destCoord + offsets[0]).r; 
        accumulator.g += texture(INPUT, destCoord + offsets[1]).g; 
        accumulator.b += texture(INPUT, destCoord + offsets[2]).b; 
        
        offsets -= increments;
    }

	fragColor = vec4(accumulator / float(sampleCount), 1.0);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}
