varying mediump vec2 var_texcoord0;
uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;
uniform lowp vec4 outline;

// 	vec4 col = texture2D(DIFFUSE_TEXTURE, var_texcoord0);
// 	float offset = 1.0/sprite_size.x;
// 
// 	if (col.a > 0.1)
// 	gl_FragColor = col;
// 	else {
// 		float a = texture2D(DIFFUSE_TEXTURE, vec2(var_texcoord0.x + offset, var_texcoord0.y)).a ;
// 		a += texture2D(DIFFUSE_TEXTURE, vec2(var_texcoord0.x, var_texcoord0.y - offset)).a;
// 		a += texture2D(DIFFUSE_TEXTURE, vec2(var_texcoord0.x - offset, var_texcoord0.y)).a;
// 		a += texture2D(DIFFUSE_TEXTURE, vec2(var_texcoord0.x, var_texcoord0.y + offset)).a;
// 
// 		if ( a > 0.9)
// 		gl_FragColor = bordercolor;
// 		else
// 		gl_FragColor = col;
// 	}
void main() {
	lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
	vec4 pixel = texture2D(texture_sampler, var_texcoord0.xy) * tint_pm;
	
	if (pixel.a >  0.0) {
		gl_FragColor = vec4(0.46, 0.79, 0.96, pixel.a);
	}
	else {
		gl_FragColor = pixel;
	}

}
