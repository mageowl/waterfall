class_name PlayerSprite extends Node2D

enum TRANSITION_BOOL {
	YES,
	NO
}

@onready var animation_tree = $AnimationTree
@onready var sprite_group = $Sprite

var prev_walk_scale := 0.0
var prev_crouch = false
var prev_dive = false

# Called when the node enters the scene tree for the first time.
func animate(properties: Dictionary):
	if properties.has("in_air"): animation_tree.set("parameters/InAir/transition_request", "yes" if properties.in_air else "no")
	if properties.has("is_crouching") and properties.is_crouching != prev_crouch:
		var tween = create_tween()
		tween.tween_property(animation_tree, "parameters/CrouchBlend/blend_amount", 1 if properties.is_crouching else 0, 0.2)
		tween.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		prev_crouch = properties.is_crouching
	if properties.has("flip_h"): sprite_group.scale.x = -1 if properties.flip_h else 1
	if properties.has("is_diving"):
		var target_rotation = 0
		if properties.is_diving:
			target_rotation = properties.dive_rotation
		
		if prev_dive != properties.is_diving:
			var tween = create_tween()
			tween.tween_property(sprite_group, "rotation", angle_distance(sprite_group.rotation, target_rotation), 0.2).as_relative()
			tween.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		else:
			sprite_group.rotation = target_rotation
		prev_dive = properties.is_diving
	
	var walk_scale = max(prev_walk_scale - 0.1, 0.0)
	if properties.has("walk_scale"): walk_scale = properties.walk_scale
	
	animation_tree.set("parameters/WalkBlend/blend_amount", walk_scale)
	
	prev_walk_scale = walk_scale

func angle_distance(from: float, to: float) -> float:
	var difference = to - from
	var anti_difference = to - (from - TAU)
	return difference if absf(difference) < absf(anti_difference) else anti_difference
