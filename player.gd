extends CharacterBody2D

signal player_moving
signal player_stopped

var speed = 50
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
	var angle = rad_to_deg(direction.angle())
	animation_direction = get_direction_index(angle) 
	var animation_name = ""  # gets animation name as string
	velocity = Vector2.ZERO
#	print("Standing Still : ", velocity.length())
	
	if global_position.distance_to(mouse_position) > 10:  # move player
		velocity = direction * speed
		is_moving = true
		move_and_slide()
		
	if is_moving:
		animation_name = walk_animations[animation_direction]
	else:
		animation_name = idle_animations[animation_direction]
	
	$AnimatedSprite2D.play(animation_name)
	
	
func start(pos):  # Initalize things for player, position, etc
	position = pos
	target = pos


func get_direction_index(angle):
	# Ensure angle is positive
	if angle < 0:
		angle += 360

		# Adjust thresholds for NW and SE
	if angle >= 337.5 or angle < 22.5:
		return 0  # East
	elif angle < 67.5:  # Was 45, adjusted for SE
		return 1  # SE, making SE more sensitive
	elif angle < 112.5:
		return 2  # South
	elif angle < 157.5:
		return 3  # SW
	elif angle < 202.5:
		return 4  # West
	elif angle < 247.5:  # Was 225, adjusted for NW
		return 5  # NW, making NW more sensitive
	elif angle < 292.5:
		return 6  # North
	else:  # This captures up to 337.5, making NE more sensitive
		return 7  # NE




	

	
