class_name PlayerDiveState extends PlayerState

var time_left = Player.DIVE_LENGTH

func _enter_state(from: String):
	time_left = Player.DIVE_LENGTH
	player.can_dive = false

func _process_state(delta):
#	if player.is_on_floor():
#		change_state("Idle")
	
	if Input.is_action_just_pressed("jump"):
		change_state("Jump")
	
	if not Input.is_action_pressed("dive"):
		change_state("Fall")
	
	player.velocity = player.get_local_mouse_position().normalized() * Player.DIVE_SPEED
	
	time_left -= delta
	if time_left <= 0:
		change_state("Fall")

func _get_animation_properties():
	return {
		"diving": true,
		"in_air": false
	}
