extends CharacterBody2D

var speed = 100
var target
var current_animation = "idle"
var a = 0


func _physics_process(delta):
	current_animation = "idle"
	var mouse = get_global_mouse_position()
	velocity = global_position.direction_to(mouse) * speed  # moves character toward click target
	
	a = snapped(mouse.angle(), PI/4) / (PI/4)
	a = wrapi(int(a), 0, 8)
	
#	look_at(target)  # turns character toward click target
	if Input.is_action_pressed("mouse_1") and global_position.distance_to(mouse) > 10:
		current_animation = "walk"
		move_and_slide()
#	$Animation.animation = current_animation + str(a)
	
func start(pos):  # Initalize things for player, position, etc
	position = pos
	target = pos
