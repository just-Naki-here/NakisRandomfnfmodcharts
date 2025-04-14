#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

const int samples = 20;
uniform float power = 0.001;

mat2 rotate2d(float angle) {
    vec2 sc = vec2(sin(angle), cos(angle));
    return mat2( sc.y, -sc.x, sc.x, sc.y );
}

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
  
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 m = vec2(0.5, 0.5);
    
    for (int i = 0; i < samples; i ++)
    {
        uv -= m;
        uv *= rotate2d( power * float(i) );   
        uv += m;
        
         fragColor += pow(texture(iChannel0, uv), vec4(2.2));
    }   
    
    fragColor /= float(samples);
    fragColor = pow(fragColor, vec4(1./2.2));
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}