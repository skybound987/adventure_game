extends CharacterBody2D

# signal player_location(global_position)

@export var speed = 100.0
var target = global_position

func _input(event):
	if event.is_action_pressed("mouse_1"):
		target = get_global_mouse_position()

func _physics_process(delta):
#	emit_signal("player_location", global_position)
	velocity = global_position.direction_to(target) * speed  # moves character toward click target
#	look_at(target)  # turns character toward click target
	if global_position.distance_to(target) > 10:
		move_and_slide()
		
		
		
