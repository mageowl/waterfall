class_name PlayerStateMachine extends Node

@onready var current_state : PlayerState = get_children()[0]

func init_states(player: Player):
	for child in get_children():
		if child is PlayerState:
			print("loox")
			child.player = player
			child.change_stated.connect(change_state)

func process_state(delta):
	current_state._process_state(delta)

func change_state(state_name: String):
	current_state._exit_state()
	current_state = get_node(state_name)
	current_state._enter_state()
