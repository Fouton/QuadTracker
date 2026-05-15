class_name BaseGrayedViewModel extends BadgedViewModel

## Key Option for textures when the badge is gray
var OPT_GRAYBADGE_TEXTURES: String = "disabled_badge_textures"
## Additional Textures for when base is grayed
var disabledBadgeTextures: Array[Texture2D]
var disabledTextures: bool = false

func _init(objController, x, y, base_textures, badge_textures, options):
	super(objController, x, y, base_textures, badge_textures, options)
	setGreyedBadgeOptions(options)

func setGreyedBadgeOptions(options):
	if options.has(OPT_GRAYBADGE_TEXTURES):
		disabledBadgeTextures = options[OPT_GRAYBADGE_TEXTURES]
		disabledTextures = true

func updateIcon():
	super.updateIcon()
	
	var baseStage: int = controller.base.getStage() 
	var badgeStage: int = controller.badge.getStage()
	
	if baseStage == 0 and disabledTextures and disabledBadgeTextures[badgeStage] != null:
		badgeImage.texture = disabledBadgeTextures[badgeStage]
		badgeImage.material = MAGENTA_FILTER_MATERIAL
	else:
		badgeImage.texture = badgeTextures[badgeStage]
		if baseStage == 0:
			badgeImage.material = GREYSCALE_MATERIAL
		else:
			badgeImage.material = MAGENTA_FILTER_MATERIAL
