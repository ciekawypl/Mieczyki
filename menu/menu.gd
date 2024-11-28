extends Node2D
 
var peer

var address = "192.168.100.4"
var port = 40000
 
func _ready() -> void:
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.connected_to_server.connect(connected_to_server)


func _on_host_pressed() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_server(port)
	
	multiplayer.multiplayer_peer = peer


func _on_join_pressed() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(address, port)
	
	multiplayer.multiplayer_peer = peer


func peer_connected(id):
	pass


func connected_to_server():
	start_game.rpc()


@rpc("any_peer", "call_local")
func start_game():
	get_tree().change_scene_to_file("res://main/Game.tscn")
