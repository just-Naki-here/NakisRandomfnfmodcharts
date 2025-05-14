// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

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
		return color;
	if (color.a == 0.0)
		return vec4(0.0, 0.0, 0.0, 0.0);
	if (!hasColorTransform)
		return color * openfl_Alphav;
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
#define iChannelTime float[4](iTime, 0.0, 0.0, 0.0)
#define iChannelResolution vec3[4](iResolution, vec3(0.0), vec3(0.0), vec3(0.0))
uniform vec4 iMouse;
uniform vec4 iDate;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	float frequency = 8.0;
	float amplitude = 0.05;
	
    vec2 texCoord = fragCoord.xy / iResolution.xy;
    
    vec2 pulse = sin(iTime - frequency * texCoord);
    float dist = 2.0 * length(texCoord.y - 0.5);
    
    vec2 newCoord = texCoord + amplitude * vec2(0.0, pulse.x); // y-axis only; 
    
    vec2 interpCoord = mix(newCoord, texCoord, dist);
	
	fragColor = texture(iChannel0, interpCoord);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}