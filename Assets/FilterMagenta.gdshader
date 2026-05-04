shader_type canvas_item;

void fragment() {
	vec4 pixel = texture(TEXTURE,UV);
	if (pixel.r >= 0.9 && pixel.b >= 0.9 && pixel.g <= 0.1) {
		COLOR = vec4(vec3(1), 0);
	}
}