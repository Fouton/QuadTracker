class_name DimensionalController extends TrackableControllerBase

var bases: Array[TrackableObject];
var maxStages: Array[int];
var index: int = 0;

func _init(baseObjects: Array[TrackableObject], maxObjectStages: Array[int]):
	self.bases = baseObjects;
	self.maxStages = maxObjectStages;
	base = bases[0];
	maxBaseStage = maxStages[0];

func onRightClick():
	if index == bases.size() - 1:
		index = 0;
	else:
		index += 1;
	base = bases[index];
	maxBaseStage = maxStages[index];
	emit_signal("state_changed");
