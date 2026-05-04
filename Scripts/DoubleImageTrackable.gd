extends TextureRect

class_name DoubleImageTrackable

var overlayTextures
var stage = 0
var filterMagenta = preload("res://Assets/FilterMagenta.gdshader")
var overlay = Sprite2D.new()

func _init(posX, posY, baseTexture, texturesArray):
	self.position = Vector2(posX,posY)
	self.overlayTextures = texturesArray
	self.texture = baseTexture[0]
	self.overlay.position = self.texture.get_size()/2
	self.overlay.texture = self.overlayTextures[0]
	self.material = ShaderMaterial.new()
	self.material.set("shader",filterMagenta)
	self.overlay.material = ShaderMaterial.new()
	self.overlay.material.set("shader",filterMagenta)
	self.add_child(self.overlay)
	_updateIcon()

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_released():
				if self.stage == self.overlayTextures.size() - 1:
					self.stage = 0
				else:
					self.stage += 1 
				_updateIcon()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_released():
				if self.stage == 0:
					self.stage = self.overlayTextures.size() - 1
				else:
					self.stage -= 1 
				_updateIcon()

func _updateIcon():
	self.overlay.texture = self.overlayTextures[self.stage]
