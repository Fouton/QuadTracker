class_name DimensionalViewModel extends ViewModelBase

## Key option for startDisabled array
const OPT_DIMENSIONAL_STARTDISABLED: String = "startDisableds"
## 2D Texture Array for baseImage to use
var textures = []
## Array of each object's startDisabled option
var startDisabled: Array[bool] = []

func _init(dimensionalController, x, y, texturesArray, options: Dictionary):
	super(dimensionalController, x, y, options)
	self.textures = texturesArray
	setDimensionalOptions(options)

func _ready():
	super._ready()
	if startDisabled.is_empty():
		startDisabled.resize(textures.size())
		for i in range(textures.size()):
			startDisabled[i] = true;

func updateIcon():
	var index: int = controller.index
	var stage: int = controller.base.getStage()
	baseImage.texture = textures[index][max(stage- (1 if startDisabled[index] else 0),0)]
	if stage == 0 and startDisabled[index]:
		baseImage.material = GREYSCALE_MATERIAL
	else:
		baseImage.material = MAGENTA_FILTER_MATERIAL
		

func setDimensionalOptions(settings: Dictionary):
	if settings.has(OPT_DIMENSIONAL_STARTDISABLED):
		startDisabled = settings[OPT_DIMENSIONAL_STARTDISABLED]
