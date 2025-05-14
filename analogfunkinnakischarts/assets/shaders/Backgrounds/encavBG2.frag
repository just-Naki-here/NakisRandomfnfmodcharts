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
#define iChannelTime float[4](iTime, 0.0, 0.0, 0.0)
#define iChannelResolution vec3[4](iResolution, vec3(0.0), vec3(0.0), vec3(0.0))
uniform vec4 iMouse;
uniform vec4 iDate;

const vec3 mainColor = vec3(2.0, 0.0, 0.0);

float sawtooth(float a, float freq) {
    if (mod(a, freq) < freq * 0.5) return mod(a, freq * 0.5);
    return freq * 0.5 - mod(a, freq * 0.5);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    float resolutionRatio = iResolution.x / iResolution.y;
    
    // uv fuckery !
    // pixelate
    
    float pxAmt = 60.0;
    
    uv.x = floor(uv.x * pxAmt) / pxAmt;
    uv.y = floor(uv.y * pxAmt) / pxAmt;
    
    // interlacing .
    float pixAmt = 2.;
    if (mod(fragCoord.y, pixAmt) < pixAmt * 0.5) {
        uv += 0.1 + sin(iTime * 0.2 + uv.y * 8.0) * 0.05;
    } else {
        uv -= 0.1 + sin(iTime * 0.2 + uv.y * 8.0 + 0.5) * 0.05;
    }
    
    vec2 uv2 = uv;
    
    vec3 color = vec3(0.1);
    
    // first one (bg-ish thing??)
    
    color = vec3(mod(abs(sawtooth(uv.x, 0.6) * resolutionRatio + sawtooth(uv.y, 0.6) + iTime * 0.3), 0.4)) * mainColor;
    
    // second one (stripes-like thing)
    
    if (uv2.x < 0.5) {
        uv2.x = 1.0 - uv2.x;
    }
    if (uv2.y > 0.5) {
        uv2.y = 1.0 - uv2.y;
    }

    uv2.x += sin(uv2.y * 4.0 + iTime) * 0.1;
    
    if (mod(abs(uv2.x * resolutionRatio + uv2.y + iTime * 0.2), 0.2) < 0.1) {
        vec3 lines = vec3(cos(uv.x * 2.0 + iTime + uv.y * 3.0)) * mainColor * 0.7;
        color = mix(color, lines, 0.3);
    }
    
    // color shortening
    // gives it a kind of like snes-like palette
    float shortAmt = 10.0;
    color = ceil(color * shortAmt) / shortAmt;
    
    // feed the frag color .
    fragColor = vec4(color, texture(iChannel0, uv).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}
