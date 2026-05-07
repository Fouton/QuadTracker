@abstract class_name ViewModelBase extends TextureRect

var controller: TrackableControllerBase

func _ready():
	controller.state_changed.connect(updateIcon);

@abstract func updateIcon()
