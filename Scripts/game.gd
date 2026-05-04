extends Node2D

const SIZE = Vector2i(1500,964)
var save_windows = false

@onready var settings = $TopBar/MenuBar/Settings
@onready var z1_entrance_rando = $"Main Section/Z1/OverworldMap/EntranceRando"
@onready var z1_standard = $"Main Section/Z1/OverworldMap/Standard"
@onready var z3_entrance_rando = $"Main Section/Z3 OW/OverworldMap/EntranceRando"
@onready var z3_standard = $"Main Section/Z3 OW/OverworldMap/Standard"
@onready var tracker = $Tracker_Popout

@onready var smmap = $"Main Section/SM/Map"	
const SMMAP = preload("res://Assets/SM/map_full.png")
const SMMAPKEYS = preload("res://Assets/SM/map_full_keysanity.png")

var currentScreen = 3
var undoList = [[],[],[],[],[],[]]

var buttons = ButtonGroup.new()
@onready var z1button = $"TopBar/Z1 OW"
@onready var m1button = $TopBar/M1
@onready var z3owbutton = $"TopBar/Z3 OW"
@onready var smbutton = $"TopBar/Super Metroid"

var config = ConfigFile.new()
var smkeys = false
var z3keys = false

func _ready():
	z1button.button_group=buttons
	m1button.button_group=buttons
	z3owbutton.button_group=buttons
	smbutton.button_group=buttons
	tracker.toggle_game(0)
	var err = config.load("user://quadtrackersettings.cfg")
	if err == OK:
		print("Loaded")
		if config.has_section_key("Settings","Zelda 1 ER"):
			var on = config.get_value("Settings","Zelda 1 ER")
			if on:
				settings.set_item_checked(1,true)
			_swap_z1_map(!on)
		if config.has_section_key("Settings","Zelda 3 ER"):
			var on = config.get_value("Settings","Zelda 3 ER")
			if on:
				settings.set_item_checked(2,true)
			_swap_z3_map(!on)
		if config.has_section_key("Settings","Zelda 3 Keys"):
			var on = config.get_value("Settings","Zelda 3 Keys")
			z3keys = on
			if on:
				settings.set_item_checked(4,true)
		if config.has_section_key("Settings","Super Metroid Keys"):
			var on = config.get_value("Settings","Super Metroid Keys")
			smkeys = on
			if on:
				settings.set_item_checked(5,true)
		if config.has_section_key("Settings","Save Window Positions"):
			var on = config.get_value("Settings","Save Window Positions")
			if on:
				settings.set_item_checked(13,true)
				if config.get_value("Settings", "Main Position"):
					get_window().position = config.get_value("Settings", "Main Position")
				if config.get_value("Settings", "Main Size"):
					get_window().size = config.get_value("Settings", "Main Size")
				if config.get_value("Settings", "Tracker Position"):
					$Tracker_Popout.position = config.get_value("Settings", "Tracker Position")
				if config.get_value("Settings", "Tracker Size"):
					$Tracker_Popout.size = config.get_value("Settings", "Tracker Size")
				if config.get_value("Settings", "Tracker Color"):
					$Tracker_Popout/ColorRect.color = config.get_value("Settings", "Tracker Color")
					$TopBar/TrackerPopout/ColorPickerButton.color = config.get_value("Settings", "Tracker Color")
				if config.get_value("Settings", "Tracker Hidden"):
					$Tracker_Popout.hide()
		_set_sm_map()
		if z3keys:
			tracker.keys[3] = true
			tracker.set_keys()
		if smkeys:
			tracker.keys[4] = true
			tracker.set_keys()
	else:
		config.clear()

func _process(_delta):
	if Input.is_action_just_released("ControlZ"):
		var node = undoList[currentScreen].pop_back()
		if node:
			node.show()

func _notification(notif):
	if notif == NOTIFICATION_WM_CLOSE_REQUEST:
		config.set_value("Settings", "Main Position", get_window().position)
		config.set_value("Settings", "Main Size", get_window().size)
		config.set_value("Settings", "Tracker Position", $Tracker_Popout.position)
		config.set_value("Settings", "Tracker Size", $Tracker_Popout.size)
		config.set_value("Settings", "Tracker Hidden", !$Tracker_Popout.visible)
		config.set_value("Settings", "Tracker Color", $Tracker_Popout/ColorRect.color)
		config.save("user://quadtrackersettings.cfg")

func _on_z_1_ow_gui_input(event):
	if event is InputEventMouseButton and event.is_released():
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				tracker.toggle_game(1)
				if $"TopBar/Z1 OW".disabled == false:
					$"TopBar/Z1 OW".text = "Zelda 1: OFF"
					$"Main Section/Z1".disable()
				else:
					$"TopBar/Z1 OW".text = "Zelda 1"
					$"Main Section/Z1".enable()
				$"TopBar/Z1 OW".disabled = !$"TopBar/Z1 OW".disabled

func _on_m_1_gui_input(event):
	if event is InputEventMouseButton and event.is_released():
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				tracker.toggle_game(2)
				if $TopBar/M1.disabled == false:
					$TopBar/M1.text = "Metroid 1: OFF"
					$"Main Section/M1".disable()
				else:
					$TopBar/M1.text = "Metroid 1"
					$"Main Section/M1".enable()
				$TopBar/M1.disabled = !$TopBar/M1.disabled

func _on_z_3_ow_gui_input(event):
	if event is InputEventMouseButton and event.is_released():
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				tracker.toggle_game(3)
				if $"TopBar/Z3 OW".disabled == false:
					$"TopBar/Z3 OW".text = "Zelda 3: OFF"
					# RUN M1 DISABLINGS (Z3 only atm)
				else:
					$"TopBar/Z3 OW".text = "Zelda 3"
				$"TopBar/Z3 OW".disabled = !$"TopBar/Z3 OW".disabled

func _on_super_metroid_gui_input(event):
	if event is InputEventMouseButton and event.is_released():
		match event.button_index:
			MOUSE_BUTTON_RIGHT:
				tracker.toggle_game(4)
				if $"TopBar/Super Metroid".disabled == false:
					$"TopBar/Super Metroid".text = "Super Metroid: OFF"
					$"Main Section/SM".disable()
				else:
					$"TopBar/Super Metroid".text = "Super Metroid"
					$"Main Section/SM".enable()
				$"TopBar/Super Metroid".disabled = !$"TopBar/Super Metroid".disabled

func _on_z_1_ow_pressed():
	$"Main Section/Z1".show()
	$"Main Section/M1".hide()
	$"Main Section/Z3 OW".hide()
	$"Main Section/Z3 DR".hide()
	$"Main Section/SM".hide()
	currentScreen = 1

func _on_m_1_pressed():
	$"Main Section/Z1".hide()
	$"Main Section/M1".show()
	$"Main Section/Z3 OW".hide()
	$"Main Section/Z3 DR".hide()
	$"Main Section/SM".hide()
	currentScreen = 2

func _on_z_3_ow_pressed():
	$"Main Section/Z1".hide()
	$"Main Section/M1".hide()
	$"Main Section/Z3 OW".show()
	$"Main Section/Z3 DR".hide()
	$"Main Section/SM".hide()
	currentScreen = 3

func _on_z_3_dungeon_pressed():
	#$"Main Section/Z1".hide()
	#$"Main Section/M1".hide()
	#$"Main Section/Z3 OW".hide()
	#$"Main Section/Z3 DR".show()
	#$"Main Section/SM".hide()
	#currentScreen = 4
	pass

func _on_super_metroid_pressed():
	$"Main Section/Z1".hide()
	$"Main Section/M1".hide()
	$"Main Section/Z3 OW".hide()
	$"Main Section/Z3 DR".hide()
	$"Main Section/SM".show()
	currentScreen = 5

func _on_tracker_popout_pressed():
	$Tracker_Popout.show()
	$Tracker_Popout.always_on_top = true
	$Tracker_Popout.always_on_top = false

func _on_settings_index_pressed(index):
	if settings.is_item_checkable(index):
		var on = settings.is_item_checked(index)
		settings.set_item_checked(index,!on)
		config.set_value("Settings", settings.get_item_text(index),!on)
		if index == 1:
			_swap_z1_map(on)
		elif index == 2:
			_swap_z3_map(on)
		elif index == 4:
			z3keys = !z3keys
			tracker.change_keys(3)
		elif index == 5:
			smkeys = !smkeys
			tracker.change_keys(4)
			_set_sm_map()
		elif index == 13 and !on:
			config.set_value("Settings", "Main Position", get_window().position)
			config.set_value("Settings", "Main Size", get_window().size)
			config.set_value("Settings", "Tracker Position", $Tracker_Popout.position)
			config.set_value("Settings", "Tracker Size", $Tracker_Popout.size)
			config.set_value("Settings", "Tracker Hidden", !$Tracker_Popout.visible)
			config.set_value("Settings", "Tracker Color", $Tracker_Popout/ColorRect.color)
		config.save("user://quadtrackersettings.cfg")
	else:
		if index == 14:
			_reset_windows()
		
func _set_sm_map():
	if smkeys:
		smmap.texture = SMMAPKEYS
	else:
		smmap.texture = SMMAP

func _swap_z1_map(on):
	if !on:
		z1_entrance_rando.show()
		z1_standard.hide()
	else:
		z1_entrance_rando.hide()
		z1_standard.show()

func _swap_z3_map(on):
	if !on:
		z3_entrance_rando.show()
		z3_standard.hide()
	else:
		z3_entrance_rando.hide()
		z3_standard.show()

func _reset_windows():
	get_window().position = DisplayServer.screen_get_position() + (DisplayServer.screen_get_size() - SIZE) / 2
	get_window().size = SIZE
	$Tracker_Popout.position = DisplayServer.screen_get_position() + (DisplayServer.screen_get_size() - $Tracker_Popout.SIZE) / 2
	$Tracker_Popout.size = $Tracker_Popout.SIZE
	$Tracker_Popout/ColorRect.color = Color(0x141414ff)
	$TopBar/TrackerPopout/ColorPickerButton.color = Color(0x141414ff)
	$Tracker_Popout.show()
	$Tracker_Popout.always_on_top = true
	$Tracker_Popout.always_on_top = false

func _on_auto_tracking_gui_input(event):
	if event is InputEventMouseButton and event.is_released():
		if Rect2($TopBar/AutoTracking.position,$TopBar/AutoTracking.size).has_point(get_global_mouse_position()):
			match event.button_index:
				MOUSE_BUTTON_LEFT:
					$Autotracking.attempt_connection()
				MOUSE_BUTTON_RIGHT:
					$"Autotracking/AutoTracking Settings".position = get_window().size/2 - $"Autotracking/AutoTracking Settings".size/2
					$"Autotracking/AutoTracking Settings".show()
