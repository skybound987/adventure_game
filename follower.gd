extends CharacterBody2D

# Follower variables
var speed = 100.0
var player_position
var target_position
@onready var player_node = get_node_or_null("/root/Main/Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	player_position = player_node.position
	target_position = (player_position - global_position).normalized()
	
	if global_position.distance_to(player_position) > 1:
		print("Getting player position...")
		velocity = target_position * speed
		move_and_slide()
	
