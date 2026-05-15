shader_type canvas_item;

void fragment() {
	vec4 pixel = texture(TEXTURE,UV);
	if (pixel.r >= 0.99 && pixel.b >= 0.99 && pixel.g <= 0.01) {
		COLOR = vec4(vec3(1), 0);
	}
}