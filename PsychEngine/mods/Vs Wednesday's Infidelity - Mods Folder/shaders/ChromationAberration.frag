#pragma header
uniform float rOffset;
uniform float gOffset;
uniform float bOffset;
void main()
{
    vec4 base = texture2D(bitmap, openfl_TextureCoordv);
    base.r = texture2D(bitmap, openfl_TextureCoordv - vec2(rOffset,0.0)).r;
    base.g = texture2D(bitmap, openfl_TextureCoordv - vec2(gOffset,0.0)).g;
    base.b = texture2D(bitmap, openfl_TextureCoordv - vec2(bOffset,0.0)).b;

    gl_FragColor = base;
}