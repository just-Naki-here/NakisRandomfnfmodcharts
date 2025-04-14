#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel1 bitmap
#define texture flixel_texture2D // texture

// variables
const float corner_harshness=0.5;
const float corner_ease=4.;

const bool fade_dir_x = false;
const bool fade_dir_y = true;
const float fade_amount = 16.;
const float fade_speed = 2.;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	// Normalized pixel coordinates (from 0 to 1)
	vec2 uv = fragCoord/iResolution.xy;

	float interpolation = pow(cos(iTime) * fade_speed, fade_amount);
	float fade = max(interpolation, 1.);

	float xx=(abs(uv.x -0.5)*corner_harshness) * (fade_dir_x ? fade : 1.0);
	float yy=(abs(uv.y -0.5)*corner_harshness) * (fade_dir_y ? fade : 1.0);
	float rr=(1.+pow((xx*xx+yy*yy),corner_ease));

	vec2 tuv=(uv - 0.5) * rr + 0.5;

	tuv=clamp(tuv, 0., 1.);

	vec4 color = texture(iChannel1, tuv);

	const float maximalInterpolation = pow(fade_speed, fade_amount*0.5);
	float color_distortion = sqrt(interpolation / maximalInterpolation); // [0,1]
	if(color_distortion > 0.)
	fragColor = color + (vec4(1.0)-color) * color_distortion;
	else
	fragColor = color;

	if(interpolation >= pow(fade_speed * 0.95, fade_amount)) fragColor = vec4(0.0);

	if(tuv.x >= 1.0) fragColor = vec4(0.0);
	if(tuv.y >= 1.0) fragColor = vec4(0.0);
	if(tuv.x <= 0.0) fragColor = vec4(0.0);
	if(tuv.y <= 0.0) fragColor = vec4(0.0);

}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}