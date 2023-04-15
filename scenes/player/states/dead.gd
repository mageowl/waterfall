class_name PlayerDeadState extends PlayerState

const DEAD_PLAYER = preload("res://scenes/player/dead_player.tscn")
var time_left = 2
var dead_player_instance

func _enter_state(state: String):
	time_left = 2
	
	dead_player_instance = DEAD_PLAYER.instantiate()
	dead_player_instance.position = player.position
	player.get_parent().add_child(dead_player_instance)
	player.visible = false
	player.velocity = Vector2.ZERO

func _process_state(delta):
	player.velocity = Vector2.ZERO
	
	time_left -= delta
	
	if time_left <= 0:
		dead_player_instance.queue_free()
		player.position = player.respawn_point
		player.visible = true
		change_state("Idle")
