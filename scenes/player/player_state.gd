class_name PlayerState extends Node

signal changed_state(state: String)

var player: Player

func change_state(state: String):
	changed_state.emit(state)

func _enter_state(from: String):
	pass

func _exit_state():
	pass

func _process_state(delta: float) -> void:
	pass

func _get_animation_properties() -> Dictionary:
	return {}
