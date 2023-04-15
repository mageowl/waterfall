class_name Player extends CharacterBody2D

const SPEED = 150.0
const CROUCH_SPEED = 50.0
const JUMP_VELOCITY = 250.0

const CYOTE_TIME = 6
const JUMP_BUFFER = 8

const GRAVITY = 1000
const GRAVITY_JUMP = 900

const FRICTION = 1.0
const FRICTION_AIR = 0.05

const DIVE_SPEED = 350.0
const DIVE_LENGTH = 0.8

@onready var respawn_point = position
@onready var state_machine: PlayerStateMachine = $States
@onready var player_sprite = $PlayerSprite
@onready var camera = $Camera2D
var can_dive = true
var invincibility = 0 

func _ready():
	state_machine.init_states(self)

func _physics_process(delta: float):
	state_machine.process_state(delta)
	player_sprite.animate(state_machine.get_animation_properties())
	
	move_and_slide()
	
	if invincibility > 0:
		invincibility -= 1

	if get_slide_collision_count() > 0:
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			var collider : RID = collision.get_collider_rid()
			if PhysicsServer2D.body_get_collision_layer(collider) == 2 and not state_machine.current_state is PlayerDeadState and invincibility <= 0:
				get_dead()

func get_dead():
	state_machine.change_state("Dead")
