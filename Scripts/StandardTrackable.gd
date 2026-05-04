extends TextureRect

class_name StandardTrackable

var textures
var grayscale = preload("res://Assets/Greyscale.gdshader")
var stage = 0
var startDisabled
var badged = false
var toggled = false
var badgeStage = 0
var badgeTextures
var badge
var loop
var greyedBadge
var hideStage1Badge
var badgeHidden = false
var extraTexture = false
var disabledBadgeTextures

func _init(x, y, texturesArray, badgedTexture = null, startDisabled = true, loop = true, disableBadge = true, hideBadge = true, trackableSizeX = 32, trackableSizeY = 32, extraTextures = null):
	self.position = Vector2(x,y)
	self.textures = texturesArray
	self.texture = textures[0]
	self.scale = Vector2(trackableSizeX,trackableSizeY)/self.texture.get_size()
	self.startDisabled = startDisabled
	self.loop = loop
	self.badgeTextures = badgedTexture
	self.greyedBadge = disableBadge
	self.hideStage1Badge = hideBadge
	if badgedTexture:
		self.badged = true
		self.badge = Sprite2D.new()
		self.badge.position = self.texture.get_size()/2
		self.badge.texture = badgedTexture[0]
		self.badge.scale = (Vector2(trackableSizeX,trackableSizeY)/self.badge.texture.get_size())/self.scale
		self.add_child(self.badge)
		if hideBadge:
			self.badgeHidden = true
			self.badge.hide()
			self.badge.material = ShaderMaterial.new()
			self.badge.material.set("shader",grayscale)
			self.badge.material = null
		else:
			self.badge.material = ShaderMaterial.new()
			self.badge.material.set("shader",grayscale)
	if extraTextures:
		self.extraTexture = true
		self.disabledBadgeTextures = extraTextures
	updateIcon()

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_released():
				if startDisabled and stage == textures.size():
					if loop:
						stage = 0
				elif !startDisabled and stage == textures.size() - 1:
					if loop:
						stage = 0
				else:
					stage += 1
				updateIcon()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_released():
				if self.badged:
					if self.badgeStage == 0:
						if self.hideStage1Badge:
							self.badgeHidden = false
							self.badge.show()
						self.badgeStage += 1
					elif self.badgeStage == self.badgeTextures.size():
						if self.hideStage1Badge:
							self.badge.hide()
							self.badgeHidden = true
						self.badgeStage = 0
					elif self.badgeStage == self.badgeTextures.size() - 1 and self.greyedBadge and !self.hideStage1Badge:
						self.badgeStage = 0
					else:
						self.badgeStage += 1
				else:
					if startDisabled and stage == 0:
						if loop:
							stage = textures.size()
					elif stage == 0:
						if loop:
							stage = textures.size() - 1
					else:
						stage -= 1
				updateIcon()

func updateIcon():
	if self.badged:
		if self.badgeStage == 0:
			self.badge.texture = self.badgeTextures[0]
		elif self.greyedBadge and !self.hideStage1Badge:
			self.badge.texture = self.badgeTextures[self.badgeStage]
		else:
			self.badge.texture = self.badgeTextures[self.badgeStage - 1]
		if self.badgeStage == 0 and !self.hideStage1Badge and !self.greyedBadge and !self.extraTexture:
			self.badge.material = ShaderMaterial.new()
			self.badge.material.set("shader",grayscale)
		elif self.greyedBadge and self.stage == 0 and !self.extraTexture:
			self.badge.material = ShaderMaterial.new()
			self.badge.material.set("shader",grayscale)
		else:
			self.badge.material = null
		if self.extraTexture and self.stage == 0:
			if self.disabledBadgeTextures[self.badgeStage]:
				self.badge.texture = self.disabledBadgeTextures[self.badgeStage]
				self.badge.material = null
			else:
				self.badge.material = ShaderMaterial.new()
				self.badge.material.set("shader",grayscale)
	if self.startDisabled:
		if self.stage == 0:
			self.texture = self.textures[0]
			self.material = ShaderMaterial.new()
			self.material.set("shader",grayscale)
		else:
			self.texture = self.textures[self.stage-1]
			self.material = null
	else:
		self.texture = self.textures[self.stage]
