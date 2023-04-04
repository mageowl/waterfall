class_name Spring extends Area2D

const SPRING_VELOCITY = 400

@onready var animation_player = $Sprite/AnimationPlayer
var bouncing = false

func _on_body_entered(body):
	if body is Player:
		animation_player.stop()
		animation_player.play("Bounce")
		body.velocity.y = -SPRING_VELOCITY
