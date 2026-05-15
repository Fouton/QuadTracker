class_name IndependentBadgedViewModel extends BadgedViewModel

## Key Option for badge item starting disabled
var OPT_BADGEDISABLED: String = "disable_badge"
## Key Option for badge item starting hidden
var OPT_BADGEHIDDEN: String = "hide_badge"
## Is Badge Disabled on Stage 0
var badgeStartDisabled: bool = true
## Is Badge Hidden on Stage 0
var badgeHidden: bool = false

func _init(objController, x, y, base_textures, badge_textures, options):
	super(objController, x, y, base_textures, badge_textures, options)
	setIndependentOptions(options)

func setIndependentOptions(options):
	if options.has(OPT_BADGEHIDDEN):
		badgeHidden = options[OPT_BADGEHIDDEN]
		badgeStartDisabled = false
	elif options.has(OPT_BADGEDISABLED):
		badgeStartDisabled = options[OPT_BADGEDISABLED]

func updateIcon():
	super.updateIcon()
	var stage: int = controller.badge.getStage()
	if badgeHidden and stage == 0:
		badgeImage.texture = null
	else:
		badgeImage.texture = badgeTextures[max(stage - 1 if badgeStartDisabled or badgeHidden else 0,0)]
		if badgeStartDisabled and stage == 0:
			badgeImage.material = GREYSCALE_MATERIAL
		else:
			badgeImage.material = MAGENTA_FILTER_MATERIAL
