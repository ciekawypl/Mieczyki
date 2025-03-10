extends Node2D
 
var peer

@export var joinaddr : LineEdit
@export var joinport : LineEdit
@export var hostport : LineEdit
 
func _ready() -> void:
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.connected_to_server.connect(connected_to_server)


func _on_host_pressed() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_server(hostport.text.to_int())
	
	multiplayer.multiplayer_peer = peer


func _on_join_pressed() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(joinaddr.text, joinport.text.to_int())
	
	multiplayer.multiplayer_peer = peer


func peer_connected(_id):
	pass


func connected_to_server():
	start_game.rpc()


@rpc("any_peer", "call_local")
func start_game():
	get_tree().change_scene_to_file("res://main/Game.tscn")
