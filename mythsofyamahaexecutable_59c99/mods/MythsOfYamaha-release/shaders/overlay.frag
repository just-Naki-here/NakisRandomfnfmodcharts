#pragma header

uniform sampler2D overlayTex;

void main() {
     vec2 pixel = gl_FragCoord.xy;
      
     gl_FragColor = flixel_texture2D(bitmap, openfl_TextureCoordv.xy);
     gl_FragColor *= texture2D(overlayTex, openfl_TextureCoordv.xy);
}