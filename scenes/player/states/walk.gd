class_name PlayerWalkState extends PlayerState

func _process_state(delta: float):
#	Handle Jump button
	if Input.is_action_just_pressed("jump"):
		change_state.emit("Jump")
	elif not player.is_on_floor():
		change_state.emit("Fall")
	
#	Get walk direction
	var direction = Input.get_axis("left", "right")
	if direction == 0:
		change_state.emit("Idle")
	else:
		player.velocity.x = Player.SPEED * direction
