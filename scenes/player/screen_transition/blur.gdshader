shader_type canvas_item;

uniform float blur_amount : hint_range(-2.0, 10.0);
uniform float mix_amount : hint_range(0.0, 1.0);
uniform vec4 color_over : source_color;
uniform sampler2D screen_texture : hint_screen_texture;

void fragment() {
	vec4 blurred = textureLod(screen_texture, SCREEN_UV, blur_amount);
	vec4 fin = mix(blurred, color_over, mix_amount);
	COLOR = fin;
}