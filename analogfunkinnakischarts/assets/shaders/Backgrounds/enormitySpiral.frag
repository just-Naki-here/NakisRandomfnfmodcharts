// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

float t;

const vec3 mainColor = vec3(0.0, 0.0, 1.0);

float spiral(vec2 m) {
	float r = length(m);
	float a = atan(m.y, m.x);
	float v = sin(200.*(sqrt(r)-0.02*a+.1*t));
	return clamp(v,0.,1.);

}

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
	t = iTime;

	vec2 uv = fragCoord.xy / iResolution.xy;
	
	vec2 m = iResolution.xy;
	m = vec2(.5,.5);

	float v = spiral(m-uv);
    
	uv = fragCoord.xy / iResolution.xy;
    vec3 col = mainColor * v;
	
	fragColor = vec4(col, texture(iChannel0, fragCoord / iResolution.xy).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}