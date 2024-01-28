extends CharacterBody2D

var speed = 100
var target
var animation_direction = 0
var mouse_position = position

var idle_animations = ["idle0", "idle1", "idle2", "idle3", "idle4", "idle5", "idle6", "idle7"]
var walk_animations = ["walk0", "walk1", "walk2", "walk3", "walk4", "walk5", "walk6", "walk7"]

func _ready():
#	animation_init = $AnimatedSprite2D
	pass

func _input(event):
	if event.is_action_pressed("mouse_1"):
		mouse_position = get_global_mouse_position()

func _physics_process(delta):
	var is_moving = false
	var direction = (mouse_position - global_position).normalized()
	velocity = global_position.direction_to(mouse_position) * speed  # moves character toward click target
	var angle = rad_to_deg(direction.angle())
	animation_direction = get_direction_index(angle)
	var animation_name = ""
#	look_at(target)  # turns character toward click target
	
	if global_position.distance_to(mouse_position) > 10:
		move_and_slide()
		is_moving = true
		
	if is_moving:
		animation_name = walk_animations[animation_direction]
	else:
		animation_name = idle_animations[animation_direction]
	
	$AnimatedSprite2D.play(animation_name)
	
	
func start(pos):  # Initalize things for player, position, etc
	position = pos
	target = pos


func get_direction_index(angle):
	if angle < 0:
		angle += 360
	var direction_index = int(angle / 45) % 8
	return direction_index
	

	
