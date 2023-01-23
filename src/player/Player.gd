extends CharacterBody2D

@export var speed := 300.0

@onready var input: PlayerInput = $PlayerInput

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var motion = input.get_action_strength("move_right") - input.get_action_strength("move_left")
	velocity.x = motion * speed
	
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
