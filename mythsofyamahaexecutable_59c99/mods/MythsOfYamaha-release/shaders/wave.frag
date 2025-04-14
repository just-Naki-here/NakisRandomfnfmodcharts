#pragma header

uniform float iTime;
uniform float waveMult;

void main() {
	vec2 uv = openfl_TextureCoordv;

	uv.x += (sin(uv.y*5.0+iTime)/500.0) * waveMult;
	uv.y += (sin(uv.x*3.0+iTime)/500.0) * waveMult;

	vec4 color = flixel_texture2D(bitmap, uv);
	
	gl_FragColor = color;
}