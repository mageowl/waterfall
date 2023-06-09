class_name PlayerStateMachine extends Node

@onready var current_state : PlayerState = get_children()[0]
@onready var current_state_id = current_state.name

func init_states(player: Player):
	for child in get_children():
		if child is PlayerState:
			child.player = player
			child.changed_state.connect(change_state)

func process_state(delta):
	current_state._process_state(delta)

func get_animation_properties() -> Dictionary:
	return current_state._get_animation_properties()

func change_state(state_name: String):
	current_state._exit_state()
	current_state = get_node(state_name)
	current_state._enter_state(current_state_id)
	current_state_id = state_name
