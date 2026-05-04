shader_type canvas_item;

void fragment() {
	vec4 pixel = texture(TEXTURE,UV);
	//float gray = pixel.r * 0.299*0.5 + pixel.g * 0.587*0.5 + pixel.b * 0.114*0.5; //true greyscale
	float gray = pixel.r * 0.316*0.5 + pixel.g * 0.460*0.5 + pixel.b * 0.224*0.5; //halfway greyscale
	//float gray = pixel.r * 0.3333*0.5 + pixel.g * 0.3333*0.5 + pixel.b * 0.3333*0.5; //emotracker greyscale
	COLOR = vec4(vec3(gray), pixel.a);
}