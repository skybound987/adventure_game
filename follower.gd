extends CharacterBody2D

# Follower variables
var speed = 50.0
var start_moving = false
var player_position
var target_position
@onready var player_node = get_node_or_null("/root/Main/Player")

var idle_animations = ["idle0", "idle1", "idle2", "idle3", "idle4", "idle5", "idle6", "idle7"]
var walk_animations = ["walk0", "walk1", "walk2", "walk3", "walk4", "walk5", "walk6", "walk7"]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var is_moving = false
	
	player_position = player_node.position
	target_position = (player_position - global_position).normalized()
	
	if global_position.distance_to(player_position) > 25 and start_moving:
		velocity = target_position * speed
		is_moving = true
		move_and_slide()
	elif global_position.distance_to(player_position) <= 25:
		velocity = Vector2.ZERO
		start_moving = false
		
#	elif global_position.distance_to(player_position) < 25:
#		velocity = -target_position * speed
#		move_and_slide()

	var angle = rad_to_deg(target_position.angle())
	var animation_direction = get_direction_index(angle) 
	var animation_name = ""  #gets animation name as string

	if is_moving:
		animation_name = walk_animations[animation_direction]
	else:
		animation_name = idle_animations[animation_direction]
	
	$AnimatedSprite2D.play(animation_name)
	

func get_direction_index(angle):
	if angle < 0:
		angle += 360
	var direction_index = int(angle / 45) % 8
	return direction_index

func _on_timer_timeout():
	start_moving = true
