class_name TrackableObject

var _name = "";
var _stage = 0;
var _code = "";

func _init(name, code):
	_name = name;
	_code = code;

func getStage():
	return _stage;

func setStage(stage):
	_stage = stage;

func getName():
	return _name;

func getCode():
	return _code;
