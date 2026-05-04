extends TextureRect

class_name ScrollablePOI

var id = ""
var dragging = false
var clicked = false
var hovered = false
var screen_boundary
var screen
var textureWheel
var wheel = 0

func _init(textures, position, boundary, hostScreen):
	self.texture = textures[0]
	self.textureWheel = textures
	self.position = position
	self.scale = Vector2(22,22) / self.size
	self.top_level = true
	self.screen_boundary = boundary
	self.screen_boundary.position = boundary.position + texture.get_size()/4
	self.screen = hostScreen

func _process(_delta):
	if Rect2(Vector2.ZERO, self.size).has_point(get_local_mouse_position()) and !hovered and !dragging:
		hovered = true
	elif clicked:
		clicked = false
		dragging = true
		hovered = false
	elif dragging:
		self.position = get_global_mouse_position() - self.size/4
	elif !Rect2(Vector2.ZERO, self.size).has_point(get_local_mouse_position()) and hovered:
		hovered = false

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.is_released() and (hovered or dragging):
			if self.wheel == 0:
				self.wheel = self.textureWheel.size() - 1
			else:
				self.wheel -= 1
			self.texture = self.textureWheel[wheel]
			self.scale = Vector2(22,22) / self.texture.get_size()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.is_released() and (hovered or dragging):
			if self.wheel == self.textureWheel.size() - 1:
				self.wheel = 0
			else:
				self.wheel += 1
			self.texture = self.textureWheel[wheel]
			self.scale = Vector2(22,22) / self.texture.get_size()
		elif event.button_index == MOUSE_BUTTON_RIGHT and dragging:
			self.queue_free()
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.is_released():
			self.hide()
			get_node("/root/Game").undoList[screen].append(self)
		elif event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and !dragging:
				clicked = true
			if dragging and event.is_released():
				if !self.screen_boundary.has_point(get_global_mouse_position()):
					self.queue_free()
				dragging = false

func getCenter():
	return self.position + (self.size/2)
