extends Node2D

@onready var map = $Map
	
const SUPERS = preload("res://Assets/Tracker/super.png")
const MISSILES = preload("res://Assets/Tracker/missile.png")
const ETANK = preload("res://Assets/Tracker/etank.png")
const PB = preload("res://Assets/Tracker/powerbomb.png")
const MORPH = preload("res://Assets/Tracker/morph.png")
const BOMBS = preload("res://Assets/SM/items/bomb.png")
const SPRING = preload("res://Assets/Tracker/springball.png")
const SPACE = preload("res://Assets/Tracker/space.png")
const SCREW = preload("res://Assets/Tracker/screw.png")
const VARIA = preload("res://Assets/Tracker/varia.png")
const GRAVITY = preload("res://Assets/Tracker/gravity.png")
const HIJUMP = preload("res://Assets/Tracker/hijump.png")
const SPEED = preload("res://Assets/Tracker/speed.png")
const GRAPPLE = preload("res://Assets/Tracker/grapple.png")

const SMITEM = [preload("res://Assets/SM/items/charge.png"),preload("res://Assets/SM/items/ice.png"),preload("res://Assets/SM/items/wave.png"),\
preload("res://Assets/SM/items/spazer.png"),preload("res://Assets/SM/items/plasma.png"),preload("res://Assets/SM/items/morph.png"),\
preload("res://Assets/SM/items/bomb.png"),preload("res://Assets/SM/items/springball.png"),preload("res://Assets/SM/items/grapple.png"),\
preload("res://Assets/SM/items/xray.png"),preload("res://Assets/SM/items/varia.png"),preload("res://Assets/SM/items/hijump.png"),\
preload("res://Assets/SM/items/space.png"),preload("res://Assets/SM/items/gravity.png"),preload("res://Assets/SM/items/speed.png"),\
preload("res://Assets/SM/items/screw.png"),preload("res://Assets/Tracker/etank.png"),preload("res://Assets/SM/items/powerbomb.png"),\
preload("res://Assets/SM/items/super.png"),preload("res://Assets/SM/items/missile.png"),preload("res://Assets/SM/items/reservetank.png"),\
preload("res://Assets/SM/items/sm_keycard_level1.png"),preload("res://Assets/SM/items/sm_keycard_level2.png"),preload("res://Assets/SM/items/sm_keycard_boss.png")]

const ITEM_START_X = -70
const ITEM_START_Y = 45
const ITEM_SIZE = 44
const ITEM_GAP_Y = 6
#const ITEM_GAP_X = 2

var boundary
var undoList = []

func _ready():
	boundary = Rect2(map.position, map.get_rect().size + map.position)
	
	# Parents
	_make_parent(MISSILES,ITEM_START_X,ITEM_START_Y+0*(ITEM_SIZE+ITEM_GAP_Y),"Missile")
	_make_parent(SUPERS,ITEM_START_X,ITEM_START_Y+1*(ITEM_SIZE+ITEM_GAP_Y),"Super")
	_make_parent(PB,ITEM_START_X,ITEM_START_Y+2*(ITEM_SIZE+ITEM_GAP_Y),"PB")
	_make_parent(ETANK,ITEM_START_X,ITEM_START_Y+3*(ITEM_SIZE+ITEM_GAP_Y),"E Tank")
	_make_parent(MORPH,ITEM_START_X,ITEM_START_Y+4*(ITEM_SIZE+ITEM_GAP_Y),"Morph")
	_make_parent(BOMBS,ITEM_START_X,ITEM_START_Y+5*(ITEM_SIZE+ITEM_GAP_Y),"Bombs")
	_make_parent(SPRING,ITEM_START_X,ITEM_START_Y+6*(ITEM_SIZE+ITEM_GAP_Y),"Spring")
	_make_parent(SPACE,ITEM_START_X,ITEM_START_Y+7*(ITEM_SIZE+ITEM_GAP_Y),"Space")
	_make_parent(SCREW,ITEM_START_X,ITEM_START_Y+8*(ITEM_SIZE+ITEM_GAP_Y),"Screw")
	_make_parent(VARIA,ITEM_START_X,ITEM_START_Y+9*(ITEM_SIZE+ITEM_GAP_Y),"Varia")
	_make_parent(GRAVITY,ITEM_START_X,ITEM_START_Y+10*(ITEM_SIZE+ITEM_GAP_Y),"Gravity")
	_make_parent(HIJUMP,ITEM_START_X,ITEM_START_Y+11*(ITEM_SIZE+ITEM_GAP_Y),"Hijump")
	_make_parent(SPEED,ITEM_START_X,ITEM_START_Y+12*(ITEM_SIZE+ITEM_GAP_Y),"Speed")
	_make_parent(GRAPPLE,ITEM_START_X,ITEM_START_Y+13*(ITEM_SIZE+ITEM_GAP_Y),"Grapple")
	_make_scrollable_parent($"../Z1".Z1ITEM,ITEM_START_X,ITEM_START_Y+14*(ITEM_SIZE+ITEM_GAP_Y))
	_make_scrollable_parent($"../M1".M1ITEM,ITEM_START_X,ITEM_START_Y+15*(ITEM_SIZE+ITEM_GAP_Y))
	_make_scrollable_parent($"../Z3 OW".Z3ITEM,ITEM_START_X,ITEM_START_Y+16*(ITEM_SIZE+ITEM_GAP_Y))
	
	# Crateria
	_make_marker(1,528,50,"Crateria Surface Power Bomb")
	_make_marker(1,278,65,"Gauntlet ETank")
	_make_marker(1,184,81,"Gauntlet Missiles")
	_make_marker(1,200,128,"Terminator ETank")
	_make_marker(1,262,143,"Crateria Middle Missiles")
	_make_marker(1,402,128,"Bombs")
	_make_marker(1,325,316,"Crateria Bottom Missiles")
	_make_marker(1,388,175,"Crateria Super Missiles")
	_make_marker(1,574,97,"Wrecked Ship Moat Missiles")
	_make_marker(1,606,112,"Wrecked Ship Sunken Missiles")
	_make_marker(1,623,33,"Wrecked Ship Top Missiles")
	_make_marker(1,606,65,"Wrecked Ship Middle Missiles")
	
	# Brinstar
	_make_marker(1,122,362,"Green Brin Top Super")
	_make_marker(1,138,378,"Green Brin Top Missile")
	_make_marker(1,167,378,"Green Brin Reserve")
	_make_marker(1,185,378,"Green Brin Hidden Missiles")
	_make_marker(1,153,425,"Green Brin PBs")
	_make_marker(1,43,471,"Green Brin Supers")
	_make_marker(1,61,471,"Etecoons ETank")
	_make_marker(1,91,518,"Waterway ETank")
	_make_marker(1,231,425,"Pink Brin Top Missiles")
	_make_marker(1,200,440,"Pink Brin PBs")
	_make_marker(1,231,470,"Pink Brin Bottom Missiles")
	_make_marker(1,231,488,"Charge Beam")
	_make_marker(1,293,440,"Pink Brin ETank")
	_make_marker(1,340,456,"Pink Brin Super")
	_make_marker(1,325,472,"Blue Brin PB")
	_make_marker(1,309,487,"Green Brin Pipe Missile")
	_make_marker(1,357,472,"Morph ball")
	_make_marker(1,403,487,"Blue Brin Bottom Missile")
	_make_marker(1,448,472,"Brin Ceiling ETank")
	_make_marker(1,466,472,"Blue Brin Mid Missile")
	_make_marker(1,419,440,"Blue Brin Top Missiles")
	_make_marker(1,325,550,"XRay")
	_make_marker(1,513,440,"Red Brin Top PBs")
	_make_marker(1,514,487,"Red Brin Lower PBs")
	_make_marker(1,496,487,"Red Brin Missiles")
	_make_marker(1,559,581,"Spazer")
	_make_marker(1,638,612,"Kraid ETank")
	_make_marker(1,699,596,"Kraid Missiles")
	_make_marker(1,856,611,"Varia")
	
	# Wrecked Ship
	_make_marker(1,870,34,"Wrecked Ship Top Missiles")
	_make_marker(1,777,50,"Wrecked Ship Reserve")
	_make_marker(1,699,81,"Gravity Suit")
	_make_marker(1,746,81,"Gravity Missiles")
	_make_marker(1,824,81,"Wrecked Ship Etank")
	_make_marker(1,730,128,"Wrecked Ship Mid Missiles")
	_make_marker(1,777,144,"Wrecked Ship Left Supers")
	_make_marker(1,871,144,"Wrecked Ship Right Supers")
	
	# Maridia
	_make_marker(1,839,346,"Plasma Beam")
	_make_marker(1,716,409,"Yellow Maridia Missile")
	_make_marker(1,590,409,"Watering Hole")
	_make_marker(1,558,503,"Maridia Spark Missile")
	_make_marker(1,575,487,"Green Maridia Super")
	_make_marker(1,684,503,"Mama Turtle ETank")
	_make_marker(1,699,518,"Mama Turtle Missile")
	_make_marker(1,715,534,"Left Sand Pits")
	_make_marker(1,761,533,"Right Sand Pit Missile")
	_make_marker(1,778,549,"Right Sand Pit Super")
	_make_marker(1,776,456,"Pink Maridia Missile")
	_make_marker(1,794,456,"Pink Maridia Super")
	_make_marker(1,918,565,"Springball")
	_make_marker(1,855,440,"Botwoon ETank")
	_make_marker(1,1060,425,"Draygon Missile")
	_make_marker(1,996,472,"Space Jump")
	
	# Norfair
	_make_marker(1,528,659,"Ice Beam")
	_make_marker(1,481,691,"Ice Beam Missile")
	_make_marker(1,591,706,"Hi Jump ETank")
	_make_marker(1,573,706,"Hi Jump Missile")
	_make_marker(1,558,721,"Hi Jump")
	_make_marker(1,621,721,"Croc Missile")
	_make_marker(1,700,691,"Lava Missile")
	_make_marker(1,730,658,"Bubble Reserve")
	_make_marker(1,777,658,"Bubble Left Missile")
	_make_marker(1,809,706,"Bubble Bottom Missile")
	_make_marker(1,1010,659,"Speed Missile")
	_make_marker(1,1027,659,"Speed")
	_make_marker(1,855,690,"Wave Left Missile")
	_make_marker(1,902,688,"Wave Beam")
	_make_marker(1,902,706,"Wave Lower Missile")
	_make_marker(1,590,783,"Croc PB")
	_make_marker(1,747,783,"Croc ETank")
	_make_marker(1,887,784,"Mickey Mouse Missiles")
	_make_marker(1,497,877,"Grapple")
	_make_marker(1,575,861,"Grapple Missiles")
	_make_marker(1,668,861,"Below Croc Missiles")
	_make_marker(1,730,861,"Gold Torizo Missiles")
	_make_marker(1,748,861,"Gold Torizo Supers")
	_make_marker(1,762,877,"Screw")
	_make_marker(1,995,705,"Above Fleas Missiles")
	_make_marker(1,1026,721,"Above Fleas PB")
	_make_marker(1,1026,797,"Fleas ETank")
	_make_marker(1,949,846,"PBs of Shame")
	_make_marker(1,793,893,"Ridley ETank")
	

func _make_marker(type, x, y, id, texture = null):
	var marker = Marker.new(type,x,y,id, texture, 5)
	#marker.scale = Vector2(1.5,1.5)
	marker.position -= Vector2(3,3)
	map.add_child(marker)

func _make_parent(texture,x,y,id):
	var poi = ParentPOI.new(texture,x,y,id, boundary, 5)
	map.add_child(poi)

func _make_scrollable_parent(texture,x,y):
	var poi = ScrollableParent.new(texture,x,y, boundary, 5)
	map.add_child(poi)

func disable():
	$"../Z3 OW/SM-DM".hide()
	$"../Z3 OW/SM-Hylia".hide()
	$"../Z3 OW/SM-MireRight".hide()
	$"../Z3 OW/SM-DarkIceRod".hide()
	for n in $"../Z3 OW".smdoors:
		n.show()

func enable():
	$"../Z3 OW/SM-DM".show()
	$"../Z3 OW/SM-Hylia".show()
	$"../Z3 OW/SM-MireRight".show()
	$"../Z3 OW/SM-DarkIceRod".show()
	for n in $"../Z3 OW".smdoors:
		n.hide()
