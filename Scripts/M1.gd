extends Node2D

const BOMBS = preload("res://Assets/M1/items/m-bombs.png")
const ICE = preload("res://Assets/M1/items/m-ice.png")
const LONG = preload("res://Assets/M1/items/m-long.png")
const WAVE = preload("res://Assets/M1/items/m-wave.png")
const JUMP = preload("res://Assets/M1/items/m-jump.png")
const MORPH = preload("res://Assets/M1/items/m-morph.png")
const SCREW = preload("res://Assets/M1/items/m-screw.png")
const VARIA = preload("res://Assets/M1/items/m-varia.png")
const ETANK = preload("res://Assets/M1/items/m-etank.png")
const MISSILE = preload("res://Assets/M1/items/m-missile.png")

const M1ITEM = [preload("res://Assets/M1/items/m-morph.png"),preload("res://Assets/M1/items/m-bombs.png"),preload("res://Assets/M1/items/m-long.png"),\
preload("res://Assets/M1/items/m-ice.png"),preload("res://Assets/M1/items/m-wave.png"),preload("res://Assets/M1/items/m-varia.png"),\
preload("res://Assets/M1/items/m-jump.png"),preload("res://Assets/M1/items/m-screw.png"),preload("res://Assets/M1/items/m-etank.png"),\
preload("res://Assets/M1/items/m-missile.png")]

const ITEM_START_X = -70
const ITEM_START_Y = 73
const ITEM_SIZE = 44
const ITEM_GAP_Y = 18
#const ITEM_GAP_X = 18

@onready var map = $Map

var boundary
var undoList = []

func filterParents(parent,idMatch):
	if parent.id.begins_with(idMatch):
		return true
	return false

func _ready():
	boundary = Rect2(map.position, map.get_rect().size + map.position)
	
	# Items
	_make_parent(MORPH,ITEM_START_X,ITEM_START_Y,"Morph Ball")
	_make_parent(BOMBS,ITEM_START_X,ITEM_START_Y+1*(ITEM_SIZE+ITEM_GAP_Y),"Morph Bombs")
	_make_parent(LONG,ITEM_START_X,ITEM_START_Y+2*(ITEM_SIZE+ITEM_GAP_Y),"Long Beam")
	_make_parent(WAVE,ITEM_START_X,ITEM_START_Y+3*(ITEM_SIZE+ITEM_GAP_Y),"Wave Beam")
	_make_parent(ICE,ITEM_START_X,ITEM_START_Y+4*(ITEM_SIZE+ITEM_GAP_Y),"Ice Beam")
	_make_parent(VARIA,ITEM_START_X,ITEM_START_Y+5*(ITEM_SIZE+ITEM_GAP_Y),"Varia")
	_make_parent(JUMP,ITEM_START_X,ITEM_START_Y+6*(ITEM_SIZE+ITEM_GAP_Y),"Jump")
	_make_parent(SCREW,ITEM_START_X,ITEM_START_Y+7*(ITEM_SIZE+ITEM_GAP_Y),"Screw")
	_make_parent(MISSILE,ITEM_START_X,ITEM_START_Y+8*(ITEM_SIZE+ITEM_GAP_Y),"Missile")
	_make_parent(ETANK,ITEM_START_X,ITEM_START_Y+9*(ITEM_SIZE+ITEM_GAP_Y),"ETank")
	_make_scrollable_parent($"../Z1".Z1ITEM,ITEM_START_X,ITEM_START_Y+10*(ITEM_SIZE+ITEM_GAP_Y))
	_make_scrollable_parent($"../Z3 OW".Z3ITEM,ITEM_START_X,ITEM_START_Y+11*(ITEM_SIZE+ITEM_GAP_Y))
	_make_scrollable_parent($"../SM".SMITEM,ITEM_START_X,ITEM_START_Y+12*(ITEM_SIZE+ITEM_GAP_Y))
	
	# Blue Area
	_make_marker(1,304,110,"Long Beam")
	_make_marker(1,537,22,"Varia Suit")
	_make_marker(1,800,51,"Triple Lava Pillar Missile")
	_make_marker(1,887,51,"Top Right Corridor ETank")
	_make_marker(1,829,109,"Bombs")
	_make_marker(1,829,168,"Right Lava ETank")
	_make_marker(1,654,227,"Brinstar Ice Beam")
	_make_marker(1,624,285,"Pre Norfair Missile")
	_make_marker(1,361,373,"Morph Wall ETank")
	_make_marker(1,157,373,"Morph Ball")
	
	# Green Area
	_make_marker(1,215,607,"Green Top Left Missile")
	_make_marker(1,361,607,"Green Top Right Missile")
	_make_marker(1,391,636,"Green Top ETank")
	_make_marker(1,391,724,"Green Bottom Right Missile")
	_make_marker(1,244,783,"Green Bottom Left Missile")
	_make_marker(1,333,841,"Kraid ETank")

	# Red Area
	_make_marker(1,888,285,"Red Top Left Missile")
	_make_marker(1,917,285,"Red Top Right Missile")
	_make_marker(1,858,314,"Red Triple Missile Left")
	_make_marker(1,888,314,"Red Triple Missile Middle")
	_make_marker(1,917,314,"Red Triple Missile Right")
	_make_marker(1,858,343,"Norfair Ice Beam")
	_make_marker(1,624,402,"Red Top Left Connector")
	_make_marker(1,595,431,"Red Mid Left Missile")
	_make_marker(1,654,431,"Orange Corridor Left Missile")
	_make_marker(1,683,431,"Orange Corridor Right Missile")
	_make_marker(1,536,460,"Screw Attack")
	_make_marker(1,887,489,"Hijump")
	_make_marker(1,858,549,"Norfair ETank")
	_make_marker(1,917,578,"Right Eyes Missile")
	_make_marker(1,624,606,"Wave Beam")
	_make_marker(1,654,636,"Bottom Eyes Missile Left")
	_make_marker(1,683,636,"Bottom Eyes Missile Right")
	
	# Purple Area
	_make_marker(1,625,724,"Purple Top Missile")
	_make_marker(1,595,753,"Hidden Fall Shaft ETank")
	_make_marker(1,800,812,"Jump Missile")
	_make_marker(1,537,870,"Ridley ETank")
	_make_marker(1,683,899,"Below Ridley Missile")
	
func _make_marker(type, x, y, id):
	var marker = Marker.new(type,x,y,id, null, 2)
	#marker.scale = Vector2(1.5,1.5)
	marker.position -= Vector2(3,3)
	map.add_child(marker)

func _make_parent(texture,x,y,id):
	var poi = ParentPOI.new(texture,x,y,id, boundary, 2)
	map.add_child(poi)

func _make_scrollable_parent(texture,x,y):
	var poi = ScrollableParent.new(texture,x,y, boundary, 2)
	map.add_child(poi)

func disable():
	$"../Z3 OW/M1-LJHouse".hide()
	$"../Z3 OW".m1door.show()

func enable():
	$"../Z3 OW/M1-LJHouse".show()
	$"../Z3 OW".m1door.hide()
