extends Node

const URL = "ws://localhost:"
var port = 8080
var devices

var _socket = WebSocketPeer.new()
var _timer = null
var rundata = true

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)

func _process(_delta):
	_socket.poll()
	var state = _socket.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		if rundata:
			print("Getting Devices...")
			var init_data = {'Opcode': "DeviceList", 'Space': "SNES"}
			_socket.send_text(JSON.stringify(init_data))
			rundata = false
		else:
			while _socket.get_available_packet_count():
				print("Packet: ", _socket.get_packet().get_string_from_utf8())
	else:
		pass#print(state)

func autotrack():
	print("connect?")

func attempt_connection():
	var err = _socket.connect_to_url(URL + str(port))
	if err != OK:
		print("Unable to connect")
		set_process(false)
	else:
		await get_tree().create_timer(2).timeout
		set_process(true)
