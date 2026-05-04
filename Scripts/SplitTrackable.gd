extends TextureRect

class_name SplitTrackable

var textures
var leftStage = 0
var rightStages = []
var rightStage = 0
var separateStages

func _init(posX, posY, texturesGrid, separateStages = false):
	self.position = Vector2(posX,posY)
	self.textures = texturesGrid
	self.texture = texturesGrid[0][0]
	self.separateStages = separateStages
	if separateStages:
		for x in texturesGrid:
			self.rightStages.append(0)
	_updateIcon()

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_released():
				if self.leftStage == self.textures.size() - 1:
					self.leftStage = 0
				else:
					self.leftStage += 1 
				_updateIcon()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_released():
				if self.separateStages:
					if self.rightStages[self.leftStage] == self.textures[self.leftStage].size() - 1:
						self.rightStages[self.leftStage] = 0
					else:
						self.rightStages[self.leftStage] += 1
				else:
					if self.rightStage == self.textures[0].size() - 1:
						self.rightStage = 0
					else:
						self.rightStage += 1
				_updateIcon()

func _updateIcon():
	if self.separateStages:
		self.texture = self.textures[self.leftStage][self.rightStages[self.leftStage]]
	else:
		self.texture = self.textures[self.leftStage][self.rightStage]
