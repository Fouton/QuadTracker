@abstract class_name ViewModelBase extends TextureRect

## Magenta Filtering Shader
const MAGENTA_FILTER_MATERIAL = preload("res://Assets/FilterMagenta.tres")
## Greyscale Shader
const GREYSCALE_MATERIAL = preload("res://Assets/GreyscaleMaterial.tres")

## Controller to handle input on GUI element
var controller: TrackableControllerBase

## Option Key: background texture. Default null
const OPT_BACKGROUND: String = "background"
## Option Key: Set Size. Default Vector2(32, 32)
const OPT_SIZE: String = "size"

## Current base object texture
var baseImage: TextureRect = TextureRect.new()

## Shared constructor setup
func _init(controllerObj: TrackableControllerBase, x: int, y: int, options: Dictionary):
	self.controller = controllerObj
	self.position = Vector2(x,y)
	setGlobalOptions(options)

## On entering scene tree
func _ready():
	# Background Image will stretch to set size
	self.stretch_mode = TextureRect.STRETCH_SCALE
	
	# Base texture will draw ontop, and stretch as well
	self.add_child(baseImage)
	baseImage.stretch_mode = TextureRect.STRETCH_SCALE
	baseImage.size = self.size
	baseImage.z_index = 1
	
	# Connect the state change single to trigger updateIcon
	controller.state_changed.connect(updateIcon);
	# Calls updateIcon once for initialing correctly
	updateIcon()

## Used to change baseImage texture, and badgeImage texture when existing
@abstract func updateIcon()

## Input of left/right click call controller left/right click.
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_released():
				controller.onLeftClick()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_released():
				controller.onRightClick()

## Takes a settings dictionary and applies changes per set key
func setGlobalOptions(options: Dictionary): 
	# Sets the background if included in settings dictionary
	if options.has(OPT_BACKGROUND):
		self.texture = options[OPT_BACKGROUND]
		
	# Sets the size if included in settings dictionary, otherwise defaults to 32x32
	if options.has(OPT_SIZE):
		self.size = options[OPT_SIZE]
	else:
		self.size = Vector2(32,32)

# Likely will have a loop to clear scene tree of all view models, and then the
# controllers will be in an array or something and can be .clear()'d
## Disconnect signals when the viewmodel is being torn down just in case.
func _exit_tree():
	if controller.state_changed.is_connected(updateIcon):
		controller.state_changed.disconnect(updateIcon)
