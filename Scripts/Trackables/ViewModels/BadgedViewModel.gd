@abstract class_name BadgedViewModel extends BadgelessViewModel

## Badged texture set
var badgeTextures: Array[Texture2D]
## Current badge object texture
var badgeImage: TextureRect = TextureRect.new()

func _ready():
	# Badge texture will draw ontop, and stretch as well
	self.add_child(badgeImage)
	badgeImage.stretch_mode = TextureRect.STRETCH_SCALE
	badgeImage.size = self.size
	badgeImage.z_index = 2
	# Call the previous pieces. Needs to be after to end on updateIcon
	super._ready()

func _init(objController, x, y, base_textures, badge_textures, options: Dictionary):
	super(objController, x, y, base_textures, options)
	badgeTextures = badge_textures
