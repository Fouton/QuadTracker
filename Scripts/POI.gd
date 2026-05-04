extends TextureRect

class_name POI

var id = ""
var dragging = false
var clicked = false
var hovered = false
var linesNode = Node2D.new()
var screen_boundary
var screen

func _init(texture, position, ID, boundary, hostScreen):
	self.texture = texture
	self.position = position
	self.scale = Vector2(22,22) / self.size
	self.top_level = true
	self.screen_boundary = boundary
	self.screen_boundary.position = boundary.position + texture.get_size()/4
	self.add_child(linesNode)
	self.screen = hostScreen
	id = ID

func _process(_delta):
	if Rect2(Vector2.ZERO, self.size).has_point(get_local_mouse_position()) and !hovered and !dragging:
		hovered = true
		var parent = self.get_parent()
		if parent.siblings:
			for x in parent.siblings:
				var children = parent.get_children()
				for n in x.get_children():
					if n.get_index() != 0 and n.position != self.position and n.visible:
						var line = Line2D.new()
						line.add_point(self.position + n.size/2*n.scale)
						line.add_point(n.position + n.size/2*n.scale)
						line.top_level = true
						line.width = 4
						line.default_color = Color.RED
						linesNode.add_child(line) 
		else:
			if parent.get_children().size() > 2:
				var children = parent.get_children()
				for n in children:
					if n.get_index() != 0 and n.position != self.position and n.visible:
						var line = Line2D.new()
						line.add_point(self.position + n.size/2*n.scale)
						line.add_point(n.position + n.size/2*n.scale)
						line.top_level = true
						line.width = 4
						line.default_color = Color.RED
						linesNode.add_child(line) 
	elif clicked:
		clicked = false
		dragging = true
		hovered = false
	elif dragging:
		self.position = get_global_mouse_position() - self.size/4
		var children = linesNode.get_children()
		for n in children:
			n.queue_free()
	elif !Rect2(Vector2.ZERO, self.size).has_point(get_local_mouse_position()) and hovered:
		var children = linesNode.get_children()
		for n in children:
			n.queue_free()
		hovered = false

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and dragging:
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
