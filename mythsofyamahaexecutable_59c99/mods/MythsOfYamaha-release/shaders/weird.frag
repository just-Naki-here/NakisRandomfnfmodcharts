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
uniform float strength;

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

#define PI 3.1415

float plasma(vec2 uv) {
    float v = 0.0;
    float k = 4.0;
    vec2 c = uv * k - k / 2.0;
    
    v += sin((c.x + iTime));
    v += sin((c.y + iTime) / 2.0);
    
    v += sin((c.x + c.y + iTime) / 3.0);
    
    c += k / 2.0 * vec2(sin(iTime / 3.2), cos(iTime / 2.62));
    
    v += sin(sqrt(c.x * c.x + c.y * c.y + 1.0 ) + iTime);
    
    v = v/2.0;
    
    // vec3 col = vec3(1, sin(PI*v), cos(PI*v));
    return v;
}

float sum(vec3 p) {
    return p.r + p.g + p.b;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord/iResolution.xy;
    
    float angle = tan(plasma(uv));
    float dist = max(cos(plasma(uv)), 0.0);
    dist *= strength/10;
    
   	vec2 diff = vec2(cos(angle), sin(angle)) * dist;
    
    uv -= diff;
    
    vec2 pixDiff = diff * iResolution.xy;
    int pixDist = int(sqrt(pixDiff.x * pixDiff.x + pixDiff.y * pixDiff.y));
    
    vec3 origCol = texture(iChannel0, uv).rgb;
    
    vec2 furthestPix = vec2(0.0);
    vec3 furthestCol = vec3(0.0);
    for (int pix = 0; pix < pixDist; pix++) {
        float a = float(pix) / float(pixDist);
        vec2 samplePos = uv + pixDiff * a;
        vec3 col = texture(iChannel0, fract(samplePos/iResolution.xy)).rgb;
        
        if (sum(abs(origCol - col)) > sum(furthestCol)) {
            furthestCol = abs(origCol - col);
            furthestPix = pixDiff * a;
        }
    }
    
    vec3 col = texture(iChannel0, uv + furthestPix).rgb;
    fragColor = vec4(col, texture(iChannel0, uv).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}