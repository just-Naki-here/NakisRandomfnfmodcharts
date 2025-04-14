//SHADERTOY PORT FIX
#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main
//****MAKE SURE TO remove the parameters from mainImage.
//SHADERTOY PORT FIX

void main()
{
    float fish_intensity = 2.5;

	vec2 uv = fragCoord.xy / iResolution.xy;
    float aspectRatio = iResolution.x / iResolution.y;
    float strength = fish_intensity * 0.03;
    
    vec2 intensity = vec2(strength * aspectRatio,
                          strength * aspectRatio);

    vec2 coords = uv;
    coords = (coords - 0.5) * 2.0;		
		
    vec2 realCoordOffs;
    realCoordOffs.x = (1.0 - coords.y * coords.y) * intensity.y * (coords.x); 
    realCoordOffs.y = (1.0 - coords.x * coords.x) * intensity.x * (coords.y);
	
    vec2 fuv = (uv - realCoordOffs);
    
    if(fuv.x < 0.0 || fuv.x > 1.0 || fuv.y < 0.0 || fuv.y > 1.0){
        fragColor = vec4(0.0, 0.0, 0.0, 1.0);
    }else{
        vec4 color = texture(iChannel0, fuv);	 
    
        fragColor = vec4(color);
    }
}