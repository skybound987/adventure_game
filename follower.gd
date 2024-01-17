extends CharacterBody2D

# Follower variables
var follower_position
var target_position
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	follower_position = (target_position - global_position)
	velocity = global_position.direction_to(target_position) * speed
	if global_position.distance_to(target_position) > 3:
		move_and_slide()


#	follower_position = (target_position - global_position).normalized()
#	if global_position.distance_to(target_position) > 3:
#		move_and_slide()

func update_target_position(new_target_position):
	target_position = new_target_position
