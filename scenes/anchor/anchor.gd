class_name RespawnAnchor extends Area2D

@onready var point_light_2d = $PointLight2D
var activated = false

func _on_body_entered(body):
	if body is Player and not activated:
		activated = true
		$Sprite.frame = 1
		body.respawn_point = position
		point_light_2d.enabled = true
