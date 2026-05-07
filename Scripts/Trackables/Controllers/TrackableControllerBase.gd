@abstract class_name TrackableControllerBase

var base: TrackableObject;
var maxBaseStage: int;
signal state_changed;

@abstract func onRightClick()

func onLeftClick():
	increaseObject(base, maxBaseStage);

func increaseObject(object: TrackableObject, maxStage: int):
	var stage = object.getStage();
	if stage == maxStage:
		stage = 0
	else:
		stage += 1
	object.set_stage(stage)
	emit_signal("state_changed");

func decreaseObject(object: TrackableObject, maxStage: int):
	var stage = object.getStage();
	if stage == 0:
		stage = maxStage
	else:
		stage -= 1
	object.set_stage(stage)
	emit_signal("state_changed");
