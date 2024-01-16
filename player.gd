extends CharacterBody2D


@export var speed = 300.0
var target = position


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event):
	if event.is_action_pressed("mouse_1"):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed  # moves character toward click target
#	look_at(target)  # turns character toward click target
	if position.distance_to(target) > 10:
		move_and_slide()
