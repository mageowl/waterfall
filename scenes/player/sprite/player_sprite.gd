class_name PlayerSprite extends Node2D

enum TRANSITION_BOOL {
	YES,
	NO
}

@onready var animation_tree = $AnimationTree
@onready var sprite_group = $Sprite

var prev_walk_scale := 0.0

# Called when the node enters the scene tree for the first time.
func animate(properties: Dictionary):
	if properties.has("in_air"): animation_tree.set("parameters/InAir/transition_request", "yes" if properties.in_air else "no")
	if properties.has("flip_h"): sprite_group.scale.x = -1 if properties.flip_h else 1
	
	var walk_scale = max(prev_walk_scale - 0.1, 0.0)
	if properties.has("walk_scale"): walk_scale = properties.walk_scale
	
	animation_tree.set("parameters/WalkBlend/blend_amount", walk_scale)
	
	prev_walk_scale = walk_scale
	
