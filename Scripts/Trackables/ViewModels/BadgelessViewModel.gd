class_name BadgelessViewModel extends ViewModelBase

## Key Option for Base Starting Disabled
var OPT_BASEDISABLED: String = "disable_base"
## Key Option for a disabled texture
var OPT_BASEDISABLED_TEXTURE: String = "disabled_base_texture"
## Stored Textures for Base Item
var baseTextures: Array[Texture2D]
## If base is Start Disabled
var baseStartDisabled: bool = true
## Texture when disabled instead of grayscaled
var disabledTexture: Texture2D

func _init(objController, x:int, y:int, textures: Array[Texture2D], options: Dictionary):
	super(objController, x, y, options)
	baseTextures = textures
	setBaseOptions(options)

func updateIcon():
	var stage: int = controller.base.getStage()
	baseImage.texture = baseTextures[max(stage - 1 if baseStartDisabled else 0,0)]
	
	if baseStartDisabled and stage == 0:
		if disabledTexture != null:
			baseImage.texture = disabledTexture
			baseImage.material = MAGENTA_FILTER_MATERIAL
		else:
			baseImage.material = GREYSCALE_MATERIAL
	else:
		baseImage.material = MAGENTA_FILTER_MATERIAL

func setBaseOptions(options):
	if options.has(OPT_BASEDISABLED):
		baseStartDisabled = options[OPT_BASEDISABLED]
	if options.has(OPT_BASEDISABLED_TEXTURE):
		disabledTexture = options[OPT_BASEDISABLED_TEXTURE]
