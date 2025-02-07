#pragma header

uniform float zoom;
uniform float x;
uniform float y;
void main() {
	vec2 uv = (openfl_TextureCoordv/zoom) + vec2(x,y);
	uv = abs(uv - vec2(ivec2(uv)));
	gl_FragColor = flixel_texture2D(bitmap,uv);
}