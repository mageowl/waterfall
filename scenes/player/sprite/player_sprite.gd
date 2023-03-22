class_name PlayerSprite extends Node2D

enum TRANSITION_BOOL {
	YES,
	NO
}

@onready var animation_tree = $AnimationTree

# Called when the node enters the scene tree for the first time.
func animate(on_floor: bool, velocity: Vector2, direction: int):
	animation_tree.set("parameters/InAir/transition_request", TRANSITION_BOOL.NO if on_floor else TRANSITION_BOOL.YES)
	animation_tree.set("parameters/WalkBlend/blend_amount", velocity.x / 20) # Insert max speed
	animation_tree.set("parameters/WalkScale/scale", velocity.x / 20) # Insert max speed
