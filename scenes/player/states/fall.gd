class_name PlayerFallState extends PlayerState

var cyote_time = 0
var buffer = 0

func _enter_state(from: String):
	if from != "Jump":
		cyote_time = Player.CYOTE_TIME

func _process_state(delta):
	if player.is_on_floor():
		if buffer > 0:
			change_state("Jump")
		else:
			change_state("Idle")
	else:
		player.velocity.y += Player.GRAVITY * delta
	
	if cyote_time > 0:
		cyote_time -= 1
		if Input.is_action_just_pressed("jump"):
			change_state("Jump")
	else:
		if Input.is_action_just_pressed("jump"):
			buffer = Player.JUMP_BUFFER
	
	if buffer > 0: buffer -= 1
	
#	Get walk direction
	var direction = Input.get_axis("left", "right")
	if direction == 0:
		player.velocity.x = move_toward(player.velocity.x, 0, Player.SPEED * Player.FRICTION_AIR)
	else:
		player.velocity.x = Player.SPEED * direction

func _get_animation_properties():
	var result = {
		"in_air": true,
		"is_crouching": false
	}
	if player.velocity.x != 0: result.flip_h = true if player.velocity.x < 0 else false
	
	return result
