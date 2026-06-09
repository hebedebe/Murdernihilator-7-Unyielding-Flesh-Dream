shader_type spatial;
render_mode unshaded;

uniform float mesh_height = 1.0;
uniform float mesh_offset = 0.0;
uniform float fresnel_power = 1.0;
uniform vec3 primary_color : source_color;
uniform vec3 secondary_color : source_color;
uniform vec3 highlight_color : source_color = vec3(1.0);
uniform float highlight_power = 1.5;
uniform float lowlight_power = 2.0;


float fresnel(float amount, vec3 normal, vec3 view)
{
	return pow((1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0 )), amount);
}

varying float height;
varying vec3 norm;

void vertex() {
	height = clamp(((mesh_offset-VERTEX.y)/mesh_height)+0.5,0.0,1.0);
	norm = NORMAL;
}

void fragment()
{
	float fres = fresnel(fresnel_power, NORMAL, VIEW);
	vec3 basic_fresnel = mix(secondary_color,primary_color,fres);
	vec3 gradient = mix(primary_color,secondary_color,height);
	float top_dot = clamp(dot(norm,vec3(0.0,1.0,0.0)),0.0,1.0);
	float top_light = smoothstep(0.0, 1.0, (top_dot * 0.5) / 0.05-1.0);
	float bottom_dot = clamp(dot(norm,vec3(0.0,-1.0,0.0)),0.0,1.0);
	float bottom_light = smoothstep(0.0, 1.0, (bottom_dot * 0.5) / 0.15-1.0);
	vec3 mix1 = mix(gradient,basic_fresnel,fres);
	mix1 = mix(mix1,highlight_color,highlight_power*pow(fres,2.0)*top_light/2.0);
	ALBEDO = COLOR.rgb * mix(mix1,secondary_color/2.0,lowlight_power*pow(fres,1.0)*bottom_light/2.0);
}