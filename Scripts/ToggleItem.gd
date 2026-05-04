extends TextureRect

class_name ToggleItem

var textures
var toggled = false
var grayscale = preload("res://Assets/Greyscale.gdshader")


func _init(x, y, texturesArray):
	self.position = Vector2(x,y)
	self.textures = texturesArray
	self.texture = textures[0]
	updateIcon()

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_released():
				toggled = !toggled
				updateIcon()

func updateIcon():
	if toggled:
		if textures.size() > 1:
			self.texture = textures[0]
		else:
			self.material = null
	else:
		if textures.size() > 1:
			self.texture = textures[1]
		else:
			self.material = ShaderMaterial.new()
			self.material.set("shader",grayscale)
