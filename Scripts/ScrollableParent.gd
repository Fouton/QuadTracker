extends TextureRect

class_name ScrollableParent

var textureWheel = []
var screen
var screen_boundary
var dragging = false
var clicked = false
var hovered = false
var pinned = false
var siblings
var linesNode = Node2D.new()

func _init(textures,x,y,boundary,hostScreen):
	self.texture = textures[0]
	self.textureWheel = textures
	self.position = Vector2(x,y)
	self.size = texture.get_size()
	self.scale = Vector2(44,44) / self.size
	self.screen = hostScreen
	self.screen_boundary = boundary
	self.screen_boundary.end = boundary.end - Vector2(21,21) - boundary.position
	self.add_child(linesNode)

func _process(_delta):
	if Rect2(Vector2.ZERO, self.size).has_point(get_local_mouse_position()) and !hovered:
		hovered = true
		if self.siblings:
			for x in self.siblings:
				var children = x.get_children()
				for n in children:
					if n.get_index() != 0 and n.visible:
						var line = Line2D.new()
						line.add_point(self.position + self.size/2*self.scale + self.screen_boundary.position)
						line.add_point(n.position + n.size/2*n.scale)
						line.top_level = true
						line.width = 4
						line.default_color = Color.RED
						linesNode.add_child(line)
		else:
			var children = self.get_children()
			for n in children:
				if n.get_index() != 0  and n.visible:
					var line = Line2D.new()
					line.add_point(self.position + self.size/2*self.scale + self.screen_boundary.position)
					line.add_point(n.position + n.size/2*n.scale)
					line.top_level = true
					line.width = 4
					line.default_color = Color.RED
					linesNode.add_child(line)
	elif clicked and !Rect2(Vector2.ZERO, self.size).has_point(get_local_mouse_position()):
		clicked = false
		dragging = true
		_cursorImage(self.texture)
		hovered = false
		var children = linesNode.get_children()
		for n in children:
			n.queue_free()
	elif !Rect2(Vector2.ZERO, self.size).has_point(get_local_mouse_position()) and hovered:
		var children = linesNode.get_children()
		for n in children:
			n.queue_free()
		hovered = false

func _input(event):
	if event is InputEventMouseButton:
		if pinned and event.button_index == MOUSE_BUTTON_RIGHT:
			pinned = false
			Input.set_custom_mouse_cursor(null)
		if pinned and event.button_index == MOUSE_BUTTON_LEFT and event.is_released() and !Rect2(Vector2.ZERO, self.size).has_point(get_local_mouse_position()):
			pinned = false
			Input.set_custom_mouse_cursor(null)
			if self.screen_boundary.has_point(get_global_mouse_position()):
				var child = ScrollablePOI.new(self.textureWheel,get_global_mouse_position(),self.screen_boundary,self.screen)
				self.add_child(child)
				warp_mouse((child.position - self.position - self.screen_boundary.position)/self.scale + self.size/4)

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and !dragging:
				clicked = true
			elif clicked and event.is_released():
				_cursorImage(self.texture)
				pinned = true
				clicked = false
			elif dragging and event.is_released():
				dragging = false
				Input.set_custom_mouse_cursor(null)
				if self.screen_boundary.has_point(get_global_mouse_position()):
					var child = ScrollablePOI.new(self.textureWheel,get_global_mouse_position(),self.screen_boundary,self.screen)
					self.add_child(child)
					warp_mouse((child.position - self.position - self.screen_boundary.position)/self.scale + self.size/4)
		elif event.button_index == MOUSE_BUTTON_RIGHT and dragging:
			dragging = false
			Input.set_custom_mouse_cursor(null)

func _cursorImage(texture):
	var image = texture.get_image()
	image.resize(22,22)
	var newTexture = ImageTexture.create_from_image(image)
	Input.set_custom_mouse_cursor(newTexture)
