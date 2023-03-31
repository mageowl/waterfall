extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var player_sprite: PlayerSprite = $PlayerSprite

func _ready():
	velocity = Vector2(0, -Player.JUMP_VELOCITY).rotated(TAU * randf_range(-0.25, 0.25))

func _physics_process(delta):
	velocity.y += Player.GRAVITY * delta
	
	player_sprite.sprite_group.rotation += velocity.x / (Player.JUMP_VELOCITY * 2)

	move_and_slide()
