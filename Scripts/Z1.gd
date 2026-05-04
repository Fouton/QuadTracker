extends Node2D

const LEVEL_1 = preload("res://Assets/Z1/entrances/levelone.png")
const LEVEL_2 = preload("res://Assets/Z1/entrances/leveltwo.png")
const LEVEL_3 = preload("res://Assets/Z1/entrances/levelthree.png")
const LEVEL_4 = preload("res://Assets/Z1/entrances/levelfour.png")
const LEVEL_5 = preload("res://Assets/Z1/entrances/levelfive.png")
const LEVEL_6 = preload("res://Assets/Z1/entrances/levelsix.png")
const LEVEL_7 = preload("res://Assets/Z1/entrances/levelseven.png")
const LEVEL_8 = preload("res://Assets/Z1/entrances/leveleight.png")
const LEVEL_9 = preload("res://Assets/Z1/entrances/zelda.png")
const STAIRS_1 = preload("res://Assets/Z1/entrances/warp1.png")
const STAIRS_2 = preload("res://Assets/Z1/entrances/warp2.png")
const STAIRS_3 = preload("res://Assets/Z1/entrances/warp3.png")
const STAIRS_4 = preload("res://Assets/Z1/entrances/warp4.png")
const SHOP_0 = preload("res://Assets/Z1/entrances/merchant.png")
const SHOP_1 = preload("res://Assets/Z1/entrances/shoparrow.png")
const SHOP_2 = preload("res://Assets/Z1/entrances/shopbait.png")
const SHOP_3 = preload("res://Assets/Z1/entrances/shopbomb.png")
const SHOP_4 = preload("res://Assets/Z1/entrances/shopbluering.png")
const SHOP_5 = preload("res://Assets/Z1/entrances/shopcandle.png")
const SHOP_6 = preload("res://Assets/Z1/entrances/shopmagicshield.png")
const SWORD_1 = preload("res://Assets/Z1/entrances/woodswordcave.png")
const SWORD_2 = preload("res://Assets/Z1/entrances/whiteswordcave.png")
const SWORD_3 = preload("res://Assets/Z1/entrances/magicswordcave.png")
const POTION = preload("res://Assets/Z1/entrances/medicine.png")
const OLDWOMAN = preload("res://Assets/Z1/entrances/oldwoman.png")
const OLDMAN = preload("res://Assets/Z1/entrances/oldman.png")
const ARROW = preload("res://Assets/Z1/items/silverarrow.png")
const BAIT = preload("res://Assets/Z1/items/bait.png")
const RAFT = preload("res://Assets/Z1/items/raft.png")
const BOOK = preload("res://Assets/Z1/items/book.png")
const RING = preload("res://Assets/Z1/items/redring.png")
const BOW = preload("res://Assets/Z1/items/bow.png")
const MAGICKEY = preload("res://Assets/Z1/items/magickey.png")
const CANDLE = preload("res://Assets/Z1/items/redcandle.png")
const BRACELET = preload("res://Assets/Z1/items/powerbracelet.png")
const WHITE_SWORD = preload("res://Assets/Z1/items/whitesword.png")
const MAGIC_SWORD = preload("res://Assets/Z1/items/magicsword.png")
const RECORDER = preload("res://Assets/Z1/items/recorder.png")
const BOMBS = preload("res://Assets/Z1/items/bomb.png")
const HEART = preload("res://Assets/Z1/items/heartcontainer.png")
const LETTER = preload("res://Assets/Z1/items/letter.png")
const BOOMERANG = preload("res://Assets/Z1/items/magicboomerang.png")
const WAND = preload("res://Assets/Z1/items/wand.png")
const LADDER = preload("res://Assets/Z1/items/ladder.png")
const KEY = preload("res://Assets/Z1/items/key.png")
const TRIFORCE = preload("res://Assets/Z1/items/z-triforceicon.png")

const Z1ITEM = [preload("res://Assets/Z1/items/magicsword.png"),preload("res://Assets/Z1/items/magicboomerang.png"),preload("res://Assets/Z1/items/redcandle.png"),\
preload("res://Assets/Z1/items/bow.png"),preload("res://Assets/Z1/items/arrow.png"),preload("res://Assets/Z1/items/recorder.png"),\
preload("res://Assets/Z1/items/wand.png"),preload("res://Assets/Z1/items/bait.png"),preload("res://Assets/Z1/items/powerbracelet.png"),\
preload("res://Assets/Z1/items/ladder.png"),preload("res://Assets/Z1/items/raft.png"),preload("res://Assets/Z1/items/magickey.png"),\
preload("res://Assets/Z1/items/heartcontainer.png"),preload("res://Assets/Z1/items/key.png"),preload("res://Assets/Z1/items/redring.png")]

@onready var overworld_map = $OverworldMap
@onready var entrance_rando = $OverworldMap/EntranceRando
@onready var standard = $OverworldMap/Standard

@onready var level_1 = $"Levels/Level 1"
@onready var level_2 = $"Levels/Level 2"
@onready var level_3 = $"Levels/Level 3"
@onready var level_4 = $"Levels/Level 4"
@onready var level_5 = $"Levels/Level 5"
@onready var level_6 = $"Levels/Level 6"
@onready var level_7 = $"Levels/Level 7"
@onready var level_8 = $"Levels/Level 8"
@onready var level_9 = $"Levels/Level 9"

@onready var left_banner = $LeftBanner
@onready var right_banner = $RightBanner

var levelMaps
var leftMap = 1
var rightMap = 2

var boundary
var undoList = []

func filterParents(parent,idMatch):
	if parent.id.begins_with(idMatch):
		return true
	return false

func _ready():
	levelMaps = [null,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,level_9]
	boundary = Rect2(overworld_map.position, overworld_map.get_rect().size + overworld_map.position)
	create_ER_map()
	create_Standard_map()
	create_map_markers()

func create_map_markers():
	# Level 1
	_make_marker_DR(1,262,318,"Lv 1: Stalfos Item")
	_make_marker_DR(1,154,312,"Lv 1: Kill Keese")
	_make_marker_DR(1,211,227,"Lv 1: Kill Stalfos")
	_make_marker_DR(1,284,227,"Lv 1: Compass")
	_make_marker_DR(1,224,186,"Lv 1: Map")
	_make_marker_DR(1,272,178,"Lv 1: Kill Goriya")
	_make_marker_DR(1,344,198,"Lv 1: Wallmaster Item")
	_make_marker_DR(1,348,145,"Lv 1: Boss Item")
	_make_marker_DR(1,392,145,"Lv 1: Triforce")
	_make_marker_DR(1,227,138,"Lv 1: Stalfos Item")
	_make_marker_DR(1,215,94,"Lv 1: Kill Goriya")
	_make_marker_DR(1,152,103,"Lv 1: Staircase Item")
	# Level 2
	_make_marker_DR(2,392,311,"Lv 2: Kill Ropes")
	_make_marker_DR(2,272,269,"Lv 2: Ropes Item")
	_make_marker_DR(2,469,259,"Lv 2: Compass")
	_make_marker_DR(2,451,227,"Lv 2: Map")
	_make_marker_DR(2,392,185,"Lv 2: Kill Ropes")
	_make_marker_DR(2,450,185,"Lv 2: Magic Boomerang")
	_make_marker_DR(2,392,144,"Lv 2: Kill Moldorms")
	_make_marker_DR(2,450,144,"Lv 2: Keese Item")
	_make_marker_DR(2,450,101,"Lv 2: Kill Gel")
	_make_marker_DR(2,410,49,"Lv 2: Kill Goriya")
	_make_marker_DR(2,391,20,"Lv 2: Boss Item")
	_make_marker_DR(2,330,22,"Lv 2: Triforce")
	# Level 3
	_make_marker_DR(3,211,311,"Lv 3: Zol Item")
	_make_marker_DR(3,211,269,"Lv 3: Kill Zols")
	_make_marker_DR(3,211,228,"Lv 3: Kill Darknuts")
	_make_marker_DR(3,150,228,"Lv 3: Compass")
	_make_marker_DR(3,88,269,"Lv 3: Kill Darknuts")
	_make_marker_DR(3,109,269,"Lv 3: Stairway Item")
	_make_marker_DR(3,88,186,"Lv 3: Item")
	_make_marker_DR(3,150,186,"Lv 3: Kill Keese")
	_make_marker_DR(3,211,186,"Lv 3: Kill Zols")
	_make_marker_DR(3,270,186,"Lv 3: Map")
	_make_marker_DR(3,331,186,"Lv 3: Boss Item")
	_make_marker_DR(3,331,146,"Lv 3: Triforce")
	_make_marker_DR(3,313,217,"Lv 3: Kill Enemies")
	_make_marker_DR(3,151,103,"Lv 3: Kill Keese")
	# Level 4
	_make_marker_DR(4,29,311,"Lv 4: Kill Keese")
	_make_marker_DR(4,153,269,"Lv 4: Compass")
	_make_marker_DR(4,92,227,"Lv 4: Keese Item")
	_make_marker_DR(4,32,183,"Lv 4: Zol Item")
	_make_marker_DR(4,169,133,"Lv 4: Hidden Stairs Item")
	_make_marker_DR(4,110,113,"Lv 4: Map")
	_make_marker_DR(4,91,17,"Lv 4: Keese Item")
	_make_marker_DR(4,229,72,"Lv 4: Boss Item")
	_make_marker_DR(4,210,21,"Lv 4: Triforce")
	# Level 5
	_make_marker_DR(5,453,316,"Lv 5: Kill Pols Voice")
	_make_marker_DR(5,314,269,"Lv 5: Gibdo Item")
	_make_marker_DR(5,386,260,"Lv 5: Kill Gibdo")
	_make_marker_DR(5,331,229,"Lv 5: Kill Zols")
	_make_marker_DR(5,392,222,"Lv 5: Kill Dodongos")
	_make_marker_DR(5,454,231,"Lv 5: Kill Zols")
	_make_marker_DR(5,393,188,"Lv 5: Map")
	_make_marker_DR(5,456,192,"Lv 5: Kill Gibdos")
	_make_marker_DR(5,454,148,"Lv 5: Compass")
	_make_marker_DR(5,454,108,"Lv 5: Floor Item")
	_make_marker_DR(5,392,106,"Lv 5: Kill Gibdos")
	_make_marker_DR(5,392,64,"Lv 5: Keese Item")
	_make_marker_DR(5,350,9,"Lv 5: Hidden Stair Item")
	_make_marker_DR(5,272,97,"Lv 5: Boss Item")
	_make_marker_DR(5,272,63,"Lv 5: Triforce")
	# Level 6
	_make_marker_DR(6,149,312,"Lv 6: Kill Wizzrobes")
	_make_marker_DR(6,29,269,"Lv 6: Compass")
	_make_marker_DR(6,29,228,"Lv 6: Kill Keese")
	_make_marker_DR(6,48,92,"Lv 6: Kill Wizzrobes")
	_make_marker_DR(6,90,103,"Lv 6: Wizzrobe Item")
	_make_marker_DR(6,90,61,"Lv 6: Kill Enemies")
	_make_marker_DR(6,108,10,"Lv 6: Hidden Stairs Item")
	_make_marker_DR(6,150,63,"Lv 6: Wizzrobe Item")
	_make_marker_DR(6,269,61,"Lv 6: Boss Item")
	_make_marker_DR(6,269,22,"Lv 6: Triforce")
	_make_marker_DR(6,331,104,"Lv 6: Kill Vires")
	_make_marker_DR(6,269,145,"Lv 6: Kill Wizzrobes")
	# Level 7
	_make_marker_DR(7,150,312,"Lv 7: Kill Moldorms")
	_make_marker_DR(7,29,312,"Lv 7: Ropes Item")
	_make_marker_DR(7,29,269,"Lv 7: Kill Keese")
	_make_marker_DR(7,90,269,"Lv 7: Kill Goriya")
	_make_marker_DR(7,270,269,"Lv 7: Kill Digdogger")
	_make_marker_DR(7,348,269,"Lv 7: Stalfos Item")
	_make_marker_DR(7,29,227,"Lv 7: Kill Dodongos")
	_make_marker_DR(7,150,227,"Lv 7: Stalfos Item")
	_make_marker_DR(7,50,133,"Lv 7: Kill Goriya")
	_make_marker_DR(7,150,144,"Lv 7: Kill Moldorms")
	_make_marker_DR(7,150,62,"Lv 7: Stairs Item")
	_make_marker_DR(7,150,103,"Lv 7: Boss Item")
	_make_marker_DR(7,210,103,"Lv 7: Triforce")
	_make_marker_DR(7,29,62,"Lv 7: Kill Enemies")
	_make_marker_DR(7,210,62,"Lv 7: Kill Goriya")
	_make_marker_DR(7,90,20,"Lv 7: Kill Goriya")
	_make_marker_DR(7,150,20,"Lv 7: Kill Goriya")
	_make_marker_DR(7,210,20,"Lv 7: Kill Moldorms")
	_make_marker_DR(7,270,20,"Lv 7: Kill Dodongos")
	# Level 8
	_make_marker_DR(8,451,311,"Lv 8: Floor Item")
	_make_marker_DR(8,330,311,"Lv 8: Kill Manhandla")
	_make_marker_DR(8,272,311,"Lv 8: Stairs Item")
	_make_marker_DR(8,391,270,"Lv 8: Kill Manhandla")
	_make_marker_DR(8,271,229,"Lv 8: Kill Darknuts")
	_make_marker_DR(8,331,229,"Lv 8: Floor Item")
	_make_marker_DR(8,391,229,"Lv 8: Kill Darknuts")
	_make_marker_DR(8,451,229,"Lv 8: Floor Item")
	_make_marker_DR(8,210,187,"Lv 8: Kill Darknuts")
	_make_marker_DR(8,291,175,"Lv 8: Kill Pols Voice")
	_make_marker_DR(8,391,187,"Lv 8: Kill Enemies")
	_make_marker_DR(8,250,155,"Lv 8: Boss Item")
	_make_marker_DR(8,451,144,"Lv 8: Kill Enemies")
	_make_marker_DR(8,271,103,"Lv 8: Triforce")
	_make_marker_DR(8,391,103,"Lv 8: Kill Manhandla")
	_make_marker_DR(8,331,62,"Lv 8: Kill Pols Voice")
	_make_marker_DR(8,453,62,"Lv 8: Stairs Item")
	_make_marker_DR(8,391,20,"Lv 8: Kill Darknuts")
	# Level 9
	_make_marker_DR(9,108,260,"Lv 9: Floor Item")
	_make_marker_DR(9,150,269,"Lv 9: Kill Keese")
	_make_marker_DR(9,393,228,"Lv 9: Kill Enemies")
	_make_marker_DR(9,451,228,"Lv 9: Kill Wizzrobes")
	_make_marker_DR(9,29,187,"Lv 9: Kill Wizzrobes")
	_make_marker_DR(9,150,187,"Lv 9: Kill Ganon")
	_make_marker_DR(9,271,187,"Lv 9: Kill Wizzrobes")
	_make_marker_DR(9,472,175,"Lv 9: Floor Item")
	_make_marker_DR(9,271,145,"Lv 9: Kill Keese")
	_make_marker_DR(9,331,145,"Lv 9: Kill Wizzrobes")
	_make_marker_DR(9,451,145,"Lv 9: Kill Vires")
	_make_marker_DR(9,229,93,"Lv 9: Floor Item")
	_make_marker_DR(9,331,104,"Lv 9: Kill Enemies")
	_make_marker_DR(9,391,104,"Lv 9: Kill Gels")
	_make_marker_DR(9,451,104,"Lv 9: Kill Petra")
	_make_marker_DR(9,48,51,"Lv 9: Hidden Stairs")
	_make_marker_DR(9,90,62,"Lv 9: Kill Lanmolas")
	_make_marker_DR(9,151,62,"Lv 9: Kill Moldorm")
	_make_marker_DR(9,331,62,"Lv 9: Kill Wizzrobes")
	_make_marker_DR(9,391,62,"Lv 9: Kill Petra")
	_make_marker_DR(9,451,20,"Lv 9: Stairs Item")

func create_Standard_map():	
	# Dungeons
	_make_parent(LEVEL_1,2,517,"Level One")
	_make_parent(LEVEL_2,48,517,"Level Two")
	_make_parent(LEVEL_3,94,517,"Level Three")
	_make_parent(LEVEL_4,140,517,"Level Four")
	_make_parent(LEVEL_5,186,517,"Level Five")
	_make_parent(LEVEL_6,2,563,"Level Six")
	_make_parent(LEVEL_7,48,563,"Level Seven")
	_make_parent(LEVEL_8,94,563,"Level Eight")
	_make_parent(LEVEL_9,140,563,"Level Nine")
	_make_parent(SWORD_1,186,563,"Sword 1")
	_make_parent(SWORD_2,186,609,"Sword 2")
	_make_parent(SWORD_3,186,655,"Sword 3")
	_make_parent(STAIRS_1,2,701,"Stairs 1")
	_make_parent(STAIRS_2,48,701,"Stairs 2")
	_make_parent(STAIRS_3,94,701,"Stairs 3")
	_make_parent(STAIRS_4,140,701,"Stairs 4")
	standard.get_child(9).pair(standard.get_children().filter(filterParents.bind("Stairs")))
	_make_parent(SHOP_0,2,609,"Shop")
	_make_parent(SHOP_1,48,609,"Shop Arrow")
	_make_parent(SHOP_2,94,609,"Shop Meat")
	_make_parent(SHOP_3,140,609,"Shop Bomb")
	_make_parent(SHOP_4,2,655,"Shop Ring")
	_make_parent(SHOP_5,48,655,"Shop Candle")
	_make_parent(SHOP_6,94,655,"Shop Shield")
	_make_parent(POTION,140,655,"Medicine")
	_make_parent(OLDWOMAN,186,701,"Old Woman")
	# ITEM PARENTS
	_make_parent(WHITE_SWORD,2,747,"White Sword")
	_make_parent(MAGIC_SWORD,48,747,"Magic Sword")
	_make_parent(BOW,94,747,"Bow")
	_make_parent(ARROW,140,747,"Arrow")
	_make_parent(TRIFORCE,186,747,"Triforce")
	_make_parent(HEART,2,793,"Heart")
	_make_parent(BOMBS,48,793,"Bombs")
	_make_parent(BOOK,94,793,"Book")
	_make_parent(KEY,140,793,"Key")
	_make_parent(MAGICKEY,186,793,"Magic Key")
	_make_parent(BOOMERANG,2,839,"Boomerang")
	_make_parent(RING,48,839,"Ring")
	_make_parent(LADDER,94,839,"Ladder")
	_make_parent(RAFT,140,839,"Raft")
	_make_parent(BRACELET,186,839,"Bracelet")
	_make_parent(CANDLE,2,885,"Candle")
	_make_parent(RECORDER,48,885,"Recorder")
	_make_parent(BAIT,94,885,"Bait")
	_make_parent(LETTER,140,885,"Letter")
	_make_parent(WAND,186,885,"Wand")
	_make_scrollable_parent($"../M1".M1ITEM,234,517)
	_make_scrollable_parent($"../Z3 OW".Z3ITEM,234,563)
	_make_scrollable_parent($"../SM".SMITEM,234,609)
	
	# Locations
	_make_marker(1,493,30,"F1 Level 9")
	_make_marker(2,945,3,"K1 White Sword")
	_make_marker(1,1068,20,"L1 Level 5")
	_make_marker(2,1338,19,"O1 Open Cave")
	_make_marker(2,143,155,"B3 Magic Sword")
	_make_marker(1,228,149,"C3 Level 6")
	_make_marker(2,454,148,"E3 Under Armos")
	_make_marker(2,1174,161,"M3 Take Any")
	_make_marker(2,1438,154,"P3 Take Any")
	_make_marker(1,693,213,"H4 Level 1")
	_make_marker(1,1163,213,"M4 Level 2")
	_make_marker(1,228,284,"C5 Level 7")
	_make_marker(1,512,278,"F5 Level 4")
	_make_marker(2,719,296,"H5 Take Any")
	_make_marker(2,1473,349,"P6 OW Item")
	_make_marker(1,1273,396,"N7 Level 8")
	_make_marker(1,424,469,"E8 Level 3")
	_make_marker(2,675,453,"H8 Wooden Sword")
	_make_marker(2,1081,452,"L8 Take Any")

func create_ER_map():
	# Dungeons
	_make_parent_ER(LEVEL_1,2,517,"Level One")
	_make_parent_ER(LEVEL_2,48,517,"Level Two")
	_make_parent_ER(LEVEL_3,94,517,"Level Three")
	_make_parent_ER(LEVEL_4,140,517,"Level Four")
	_make_parent_ER(LEVEL_5,186,517,"Level Five")
	_make_parent_ER(LEVEL_6,2,563,"Level Six")
	_make_parent_ER(LEVEL_7,48,563,"Level Seven")
	_make_parent_ER(LEVEL_8,94,563,"Level Eight")
	_make_parent_ER(LEVEL_9,140,563,"Level Nine")
	_make_parent_ER(SWORD_1,186,563,"Sword 1")
	_make_parent_ER(SWORD_2,186,609,"Sword 2")
	_make_parent_ER(SWORD_3,186,655,"Sword 3")
	_make_parent_ER(STAIRS_1,2,701,"Stairs 1")
	_make_parent_ER(STAIRS_2,48,701,"Stairs 2")
	_make_parent_ER(STAIRS_3,94,701,"Stairs 3")
	_make_parent_ER(STAIRS_4,140,701,"Stairs 4")
	entrance_rando.get_child(9).pair(entrance_rando.get_children().filter(filterParents.bind("Stairs")))
	_make_parent_ER(SHOP_0,2,609,"Shop")
	_make_parent_ER(SHOP_1,48,609,"Shop Arrow")
	_make_parent_ER(SHOP_2,94,609,"Shop Meat")
	_make_parent_ER(SHOP_3,140,609,"Shop Bomb")
	_make_parent_ER(SHOP_4,2,655,"Shop Ring")
	_make_parent_ER(SHOP_5,48,655,"Shop Candle")
	_make_parent_ER(SHOP_6,94,655,"Shop Shield")
	_make_parent_ER(POTION,140,655,"Medicine")
	_make_parent_ER(OLDWOMAN,186,701,"Old Woman")
	# ITEM PARENTS
	_make_parent_ER(WHITE_SWORD,2,747,"White Sword")
	_make_parent_ER(MAGIC_SWORD,48,747,"Magic Sword")
	_make_parent_ER(BOW,94,747,"Bow")
	_make_parent_ER(ARROW,140,747,"Arrow")
	_make_parent_ER(TRIFORCE,186,747,"Triforce")
	_make_parent_ER(HEART,2,793,"Heart")
	_make_parent_ER(BOMBS,48,793,"Bombs")
	_make_parent_ER(BOOK,94,793,"Book")
	_make_parent_ER(KEY,140,793,"Key")
	_make_parent_ER(MAGICKEY,186,793,"Magic Key")
	_make_parent_ER(BOOMERANG,2,839,"Boomerang")
	_make_parent_ER(RING,48,839,"Ring")
	_make_parent_ER(LADDER,94,839,"Ladder")
	_make_parent_ER(RAFT,140,839,"Raft")
	_make_parent_ER(BRACELET,186,839,"Bracelet")
	_make_parent_ER(CANDLE,2,885,"Candle")
	_make_parent_ER(RECORDER,48,885,"Recorder")
	_make_parent_ER(BAIT,94,885,"Bait")
	_make_parent_ER(LETTER,140,885,"Letter")
	_make_parent_ER(WAND,186,885,"Wand")
	_make_scrollable_parent_ER($"../M1".M1ITEM,234,517)
	_make_scrollable_parent_ER($"../Z3 OW".Z3ITEM,234,563)
	_make_scrollable_parent_ER($"../SM".SMITEM,234,609)
	
	# Entrance Markers
	_make_marker_ER(1,144,3,"B1")
	_make_marker_ER(1,314,19,"D1")
	_make_marker_ER(1,441,3,"E1")
	_make_marker_ER(1,493,30,"F1")
	_make_marker_ER(1,706,20,"H1")
	_make_marker_ER(1,945,3,"K1")
	_make_marker_ER(1,1068,20,"L1")
	_make_marker_ER(1,1168,3,"M1")
	_make_marker_ER(1,1263,3,"N1")
	_make_marker_ER(1,1338,19,"O1")
	_make_marker_ER(1,1449,19,"P1")
	_make_marker_ER(1,52,65,"A2")
	_make_marker_ER(1,231,65,"C2")
	_make_marker_ER(1,283,65,"D2")
	_make_marker_ER(1,441,65,"E2")
	_make_marker_ER(1,599,65,"G2")
	_make_marker_ER(1,968,84,"K2")
	_make_marker_ER(1,1175,84,"M2")
	_make_marker_ER(1,1233,90,"N2")
	_make_marker_ER(1,1382,65,"O2")
	_make_marker_ER(1,1438,84,"P2")
	_make_marker_ER(1,143,155,"B3")
	_make_marker_ER(1,228,149,"C3")
	_make_marker_ER(1,295,155,"D3")
	_make_marker_ER(1,454,148,"E3")
	_make_marker_ER(1,523,131,"F3")
	_make_marker_ER(1,576,131,"G3")
	_make_marker_ER(1,736,131,"H3")
	_make_marker_ER(1,822,161,"I3")
	_make_marker_ER(1,1174,161,"M3")
	_make_marker_ER(1,1245,132,"N3")
	_make_marker_ER(1,1438,154,"P3")
	_make_marker_ER(1,336,195,"D4")
	_make_marker_ER(1,395,213,"E4")
	_make_marker_ER(1,693,213,"H4")
	_make_marker_ER(1,1163,213,"M4")
	_make_marker_ER(1,1259,213,"N4")
	_make_marker_ER(1,228,284,"C5")
	_make_marker_ER(1,395,259,"E5")
	_make_marker_ER(1,512,278,"F5")
	_make_marker_ER(1,613,296,"G5")
	_make_marker_ER(1,719,296,"H5")
	_make_marker_ER(1,822,267,"I5")
	_make_marker_ER(1,857,284,"J5")
	_make_marker_ER(1,998,260,"K5")
	_make_marker_ER(1,1091,269,"L5")
	_make_marker_ER(1,1291,289,"N5")
	_make_marker_ER(1,1351,280,"O5")
	_make_marker_ER(1,143,354,"B6")
	_make_marker_ER(1,616,354,"G6")
	_make_marker_ER(1,1038,354,"L6")
	_make_marker_ER(1,1348,325,"O6")
	_make_marker_ER(2,1473,349,"P6")
	_make_marker_ER(1,230,396,"C7")
	_make_marker_ER(1,312,415,"D7")
	_make_marker_ER(1,412,389,"E7")
	#Z3 Connection _make_marker_ER(1,599,389,"G7")
	_make_marker_ER(1,694,389,"H7")
	_make_marker_ER(1,758,419,"I7")
	_make_marker_ER(1,1002,419,"K7")
	_make_marker_ER(1,1074,419,"L7")
	_make_marker_ER(1,1273,396,"N7")
	_make_marker_ER(1,1419,389,"P7")
	_make_marker_ER(1,60,454,"A8")
	_make_marker_ER(1,119,454,"B8")
	_make_marker_ER(1,424,469,"E8")
	_make_marker_ER(1,475,453,"F8")
	_make_marker_ER(1,593,453,"G8")
	_make_marker_ER(1,675,453,"H8")
	_make_marker_ER(1,769,483,"I8")
	_make_marker_ER(1,886,477,"J8")
	_make_marker_ER(1,1081,452,"L8")
	_make_marker_ER(1,1154,453,"M8")
	_make_marker_ER(1,1241,453,"N8")

func _make_marker_DR(lvl, x, y, id, texture = null):
	var marker = Marker.new(1,x,y,id, texture, 1)
	#marker.scale = Vector2(1.5,1.5)
	marker.position -= Vector2(5,8)
	marker.position *= 1.4367
	levelMaps[lvl].add_child(marker)
	
func _make_marker_ER(type, x, y, id):
	var marker = Marker.new(type,x,y,id, null, 1)
	#marker.scale = Vector2(1.5,1.5)
	marker.position -= Vector2(3,3)
	marker.position *= 0.804
	entrance_rando.add_child(marker)

func _make_parent_ER(texture,x,y,id):
	var poi = ParentPOI.new(texture,x-293,y-515,id, boundary, 1)
	entrance_rando.add_child(poi)

func _make_scrollable_parent_ER(texture,x,y):
	var poi = ScrollableParent.new(texture,x-293,y-515, boundary, 1)
	entrance_rando.add_child(poi)
	
func _make_marker(type, x, y, id, texture = null):
	var marker = Marker.new(type,x,y,id, texture, 1)
	#marker.scale = Vector2(1.5,1.5)
	marker.position -= Vector2(3,3)
	marker.position *= 0.804
	standard.add_child(marker)

func _make_parent(texture,x,y,id):
	var poi = ParentPOI.new(texture,x-293,y-515,id, boundary, 1)
	standard.add_child(poi)

func _make_scrollable_parent(texture,x,y):
	var poi = ScrollableParent.new(texture,x-293,y-515, boundary, 1)
	standard.add_child(poi)

func _set_left_dungeon():
	left_banner.position.y = leftMap * 54 + 409

func _set_right_dungeon():
	right_banner.position.y = rightMap * 54 + 409

func _level_clicked(lvl, left):
	if (left and rightMap == lvl) or (!left and leftMap == lvl):
		var storage = rightMap
		rightMap = leftMap
		leftMap = storage
		levelMaps[leftMap].position.x = 93
		levelMaps[rightMap].position.x = 798
		_set_left_dungeon()
		_set_right_dungeon()
	elif left:
		levelMaps[leftMap].hide()
		leftMap = lvl
		levelMaps[leftMap].position.x = 93
		levelMaps[leftMap].show()
		_set_left_dungeon()
	elif !left:
		levelMaps[rightMap].hide()
		rightMap = lvl
		levelMaps[rightMap].position.x = 798
		levelMaps[rightMap].show()
		_set_right_dungeon()

func _left_or_right(event,lvl):
	if event is InputEventMouseButton and event.is_released():
		if Rect2(Vector2(5,409+lvl*54),Vector2(80,42)).has_point(get_global_mouse_position()):
			match event.button_index:
				MOUSE_BUTTON_LEFT:
					_level_clicked(lvl,true)
				MOUSE_BUTTON_RIGHT:
					_level_clicked(lvl,false)

func _on_level_1_gui_input(event):
	_left_or_right(event,1)
func _on_level_2_gui_input(event):
	_left_or_right(event,2)
func _on_level_3_gui_input(event):
	_left_or_right(event,3)
func _on_level_4_gui_input(event):
	_left_or_right(event,4)
func _on_level_5_gui_input(event):
	_left_or_right(event,5)
func _on_level_6_gui_input(event):
	_left_or_right(event,6)
func _on_level_7_gui_input(event):
	_left_or_right(event,7)
func _on_level_8_gui_input(event):
	_left_or_right(event,8)
func _on_level_9_gui_input(event):
	_left_or_right(event,9)

func disable():
	$"../Z3 OW/Z1-KakFort".hide()
	$"../Z3 OW".z1door.show()

func enable():
	$"../Z3 OW/Z1-KakFort".show()
	$"../Z3 OW".z1door.hide()
