#pragma header
uniform float pixel_size;
void main()
{
	vec2 blocks = openfl_TextureSize / pixel_size;
	gl_FragColor = flixel_texture2D(bitmap, floor(openfl_TextureCoordv * blocks) / blocks);
}