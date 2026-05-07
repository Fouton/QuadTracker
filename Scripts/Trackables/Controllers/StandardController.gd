class_name StandardController extends TrackableControllerBase;

var badge: TrackableObject;
var maxBadgeStage: int;

func _init(baseObject, maxStage, badgeObject = null, maxBadge = 0):
	self.base = baseObject;
	self.maxBaseStage = maxStage;
	self.badge = badgeObject;
	self.maxBadgeStage = maxBadge;

func onRightClick():
	if badge == null:
		decreaseObject(base, maxBaseStage);
	else:
		increaseObject(badge, maxBadgeStage);
