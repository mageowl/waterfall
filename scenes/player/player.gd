class_name Player extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = 300.0

const CYOTE_TIME = 6
const JUMP_BUFFER = 8

const GRAVITY = 1000
const GRAVITY_JUMP = 900

const FRICTION = 1.0
const FRICTION_AIR = 0.7

@onready var state_machine: PlayerStateMachine = $States

func _ready():
	state_machine.init_states(self)

func _physics_process(delta: float):
	state_machine.process_state(delta)
	move_and_slide()
