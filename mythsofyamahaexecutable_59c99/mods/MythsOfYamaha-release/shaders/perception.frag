#pragma header

// based on https://www.shadertoy.com/view/ltjXWW
// PS: this is just a sketch of test: noise is too low quality as it is.

vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 uv = openfl_TextureCoordv.xy;
uniform float iTime;

#define L  20.
#define R(a) mat2(cos(a),sin(a),-sin(a),cos(a)) // rot
float T;                                        // B(): base noise
#define B(u) ( 1. - abs( 2.* flixel_texture2D(bitmap, (u)/1e3 ).r - 1.) )

float N(vec2 u) { // infinite perlin noise with constant image-space spectrum (like Shepard scale)
	mat2 M = R(1.7);                            // to decorelate layers
    float v = 0., t = 0.;
	for (float i=0.; i<L; i++)                  // loop on harmonics
	{   float k = mod(i-T,L),
		      a = 1.-cos(6.28*k/L),             // enveloppe
		      s = exp2(k);                      // fractal noise spectrum
		v += a/s * B(M*u*s); 
		t += a/s;  M *= M;
	}
    return v/t;
}

void main() {
	vec2 R = openfl_TextureSize.xy; 
    vec2 U = getCamPos(fragCoord);

    U = (U-.5*R)/R.y;
    T = 1.5*iTime;
    float e = 0.5*1.0/R.y;                  // tunes transition
    //float e = U.x < 0. ? 0. : .03;
    
    gl_FragColor = vec4( sqrt(smoothstep(.7-e,.7+e, N(U) )) );  // sqrt approximates gamma 1./2.2
}                                               // .7 because of interp ( otherwise .5 )