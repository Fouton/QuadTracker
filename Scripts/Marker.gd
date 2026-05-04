extends TextureRect

class_name Marker

const ENTRANCE_IMAGE = preload("res://Assets/entrance18.png")
const ITEM_IMAGE = preload("res://Assets/item18.png")
const filterMagenta = preload("res://Assets/FilterMagenta.gdshader")
var screen

func _init(type,x,y, ID, image = null, screen = 0):
	if type == 1:
		self.texture = ENTRANCE_IMAGE
	elif type == 2:
		self.texture = ITEM_IMAGE
	elif type == 3:
		self.texture = image
	
	self.size = texture.get_size()
	if type == 3:
		self.scale = Vector2(22,22) / self.size
	self.position = Vector2(x,y)
	self.screen = screen
	self.material = ShaderMaterial.new()
	self.material.set("shader",filterMagenta)
	self.tooltip_text = ID

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_released() and Rect2(Vector2.ZERO, size).has_point(get_local_mouse_position()):
			self.hide()
			get_node("/root/Game").undoList[screen].append(self)
