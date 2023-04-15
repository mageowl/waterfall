class_name Spring extends Area2D

const SPRING_VELOCITY = 400

@onready var animation_player = $Sprite/AnimationPlayer
@onready var spring_outline = $Sprite/SpringOutline
@onready var spring = $Sprite/Spring
var bouncing = false

func _process(delta):
	spring_outline.scale = spring.scale

func _on_body_entered(body):
	if body is Player:
		animation_player.stop()
		animation_player.play("Bounce")
		body.velocity.y = -SPRING_VELOCITY
		body.invincibility = 10
		print(body.invincibility)
