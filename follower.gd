extends CharacterBody2D

# Follower variables
var player_position
var target_position
var speed = 100
var player


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node_or_null("/root/Main/Player")  # Player location

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	player_position = player.global_position
	target_position = (player_position - global_position).normalized()
	
	if global_position.distance_to(player_position) > 3:
		velocity = target_position * speed
		move_and_slide()

#	follower_position = (target_position - global_position).normalized()
#	if global_position.distance_to(target_position) > 3:
#		move_and_slide()

#func update_target_position(new_target_position):
#	target_position = new_target_position
