// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.0)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// variables which are empty, they need just to avoid crashing shader
uniform vec4 iMouse;

// end of ShadertoyToFlixel header

// Created by David Gallardo - xjorma/2019
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0


#define AA

const float k = 8.0;
uniform float colR = 255.0;
uniform float colG = 255.0;
uniform float colB = 255.0;

float map(in vec3 pos)
{
    float h = -cos(iTime/8.0)*5.0;
 	float sminAcc = 0.0;
// Grids
	sminAcc += exp2(-k * (2.0 - abs(pos.y)));

    return -log2( sminAcc )/k;
}


vec3 calcNormal(vec3 pos)
{
    vec2	eps	= vec2(0.0001,0);
	float	d	= map(pos);
	return	normalize(vec3(map(pos+eps.xyy)-d,map(pos+eps.yxy)-d,map(pos+eps.yyx)-d));
}

vec3 applyFog(vec3 rgb,float distance, vec3 fogColor)
{
    float fogAmount = 1.0 - exp( -distance*0.3 );
    return mix( rgb, fogColor, fogAmount );
}

mat3 setCamera( in vec3 ro, in vec3 ta )
{
	vec3 cw = normalize(ta-ro);
	vec3 up = vec3(0, 1, 0);
	vec3 cu = normalize( cross(cw,up) );
	vec3 cv = normalize( cross(cu,cw) );
    return mat3( cu, cv, cw );
}

vec3 lavaLamp(vec3 ro,vec3 rd,vec3 cd,float dist)
{
    float t = 1.0;
    float d;
    for( int i=0; i<64; i++ )
    {
        vec3	p = ro + t*rd;
        float	h = map(p);
        t += h;
        d = dot(t*rd,cd);
        if( abs(h)<0.001 || d>dist ) break;
    }

    vec3 col = vec3(0.0);

    if( d<dist )
    {
        vec3 pos = ro + t*rd;
        vec3 nor = calcNormal(pos);

        pos *= 3.0;
        pos.z += iTime*0.4;

        vec3 proj = abs(fract(pos) - 0.5);
        proj = smoothstep(0.1, 0.0, proj);
        #if 0
        	col = vec3(dot(proj, smoothstep(0.1, 0.9, vec3(1) - abs(nor))));
        #else
            col = proj * smoothstep(0.1, 0.9, vec3(1) - abs(nor));
            col = vec3(max(max(col.x, col.y), col.z));
        #endif
        col*= vec3(colR / 100, colG / 100, colB / 100);
        col = applyFog(col, d, vec3(0));
    }
    return col;
}

void mainVR( out vec4 fragColor, in vec2 fragCoord, in vec3 ro, in vec3 rd )
{
    fragColor = vec4(lavaLamp(ro/3.0 + vec3(0.0,.0,4.0),rd ,rd,14.0) , texture(iChannel0, fragCoord / iResolution.xy).a);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec3 tot = vec3(0.0);
        
#ifdef AA
	vec2 rook[4];
    rook[0] = vec2( 1.0/8.0, 3.0/8.0);
    rook[1] = vec2( 3.0/8.0,-1.0/8.0);
    rook[2] = vec2(-1.0/8.0,-3.0/8.0);
    rook[3] = vec2(-3.0/8.0, 1.0/8.0);
    for( int n=0; n<4; ++n )
    {
        // pixel coordinates
        vec2 o = rook[n];
        vec2 p = (-iResolution.xy + 2.0*(fragCoord+o))/iResolution.y;
#else //AA
        vec2 p = (-iResolution.xy + 2.0*fragCoord)/iResolution.y;
#endif //AA
 
        // camera	
        vec3 ro = 4.0*vec3( sin(0.00*iMouse.x), 0.2 , cos(0.00*iMouse.x) );
        //vec3 ro = vec3(0.0,0.0,4.0);
        vec3 ta = vec3( 0 );
        // camera-to-world transformation
        mat3 ca = setCamera( ro, ta );
        //vec3 cd = ca[2];    
        
        vec3 rd =  ca*normalize(vec3(p,1.0));        
        
        vec3 col = lavaLamp(ro ,rd ,ca[2],7.0);

	    tot += col;
#ifdef AA
    }
    tot /= 4.0;
#endif
    
    //tot = pow(tot, vec3(1.0 / 2.2));

	fragColor = vec4( tot, 1.0 );
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}