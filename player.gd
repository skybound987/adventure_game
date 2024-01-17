extends CharacterBody2D

var speed = 100
var target = global_position
var last_update_position
var update_threshold = 10  # Updates follower every 10 units of movement versus every frame


func _input(event):
	if event.is_action_pressed("mouse_1"):
		target = get_global_mouse_position()

func _process(delta):
	velocity = global_position.direction_to(target) * speed  # moves character toward click target
#	look_at(target)  # turns character toward click target
	if global_position.distance_to(target) > 10:
		move_and_slide()
	
		
