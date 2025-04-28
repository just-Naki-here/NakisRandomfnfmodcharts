#pragma header

uniform float iTime;
uniform vec2 iResolution;

void main() {
    vec2 uv = openfl_TextureCoordv;
    
    float wave = sin((uv.y + iTime) * 10.0) * 0.02;
    uv.x += wave;
    
    gl_FragColor = texture2D(bitmap, uv);
}
