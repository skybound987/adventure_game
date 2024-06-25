extends CharacterBody2D

var speed = 50
var target
var animation_direction = 0
var mouse_position = position
var is_attacking = false
@onready var animations = $Animation

var idle_animations = ["idle0", "idle1", "idle2", "idle3", "idle4", "idle5", "idle6", "idle7"]
var walk_animations = ["walk0", "walk1", "walk2", "walk3", "walk4", "walk5", "walk6", "walk7"]
var attack_animations = ["attack0", "attack1", "attack2", "attack3", "attack4", "attack5", "attack6", "attack7"]

func _ready():
	pass


	
#func _input(event):
	#if event.is_action_pressed("mouse_1"):
		#mouse_position = get_global_mouse_position()

func _process(delta):
	var is_moving = false
#	var direction = (mouse_position - global_position)
#	var angle = rad_to_deg(direction.angle())
	var animation_name = ""  # gets animation name as string
	var is_atacking = false
		
	velocity = Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		is_moving = true
		
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		is_moving = true

	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		is_moving = true
		
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		is_moving = true
	
	if Input.is_action_just_pressed("mouse_1") and not is_attacking:
#		mouse_position = get_global_mouse_position()
		is_attacking = true
		var angle = rad_to_deg(velocity.angle())
		animation_direction = get_direction_index(angle)
		animation_name = attack_animations[animation_direction]
		$Animation.play(animation_name)
		print("attack attack attack")
		
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")	
	
	if (direction.x != 0) and (direction.y !=0):
		velocity = (direction * Vector2(2,1) * speed)
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	#if is_on_stair_tile():
		#adjust_y_bias()
	
	if is_moving:
		move_and_slide()
		var angle = rad_to_deg(velocity.angle())
		animation_direction = get_direction_index(angle)
		animation_name = walk_animations[animation_direction]
	else:
		animation_name = idle_animations[animation_direction]
	
	if not is_attacking:
		$AnimatedSprite2D.play(animation_name)

		
func _on_animation_animation_finished(anim_name):
	is_attacking = false
	

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
	elif angle < 63.0:  # Was 45, adjusted for SE
		return 1  # SE, making SE more sensitive
	elif angle < 112.5:
		return 2  # South
	elif angle < 165.0:
		return 3  # SW
	elif angle < 202.5:
		return 4  # West
	elif angle < 247.5:  # Was 225, adjusted for NW
		return 5  # NW, making NW more sensitive
	elif angle < 292.5:
		return 6  # North
	else:  # This captures up to 337.5, making NE more sensitive
		return 7  # NE


#func is_on_stair_tile() -> bool:
	## Assuming a TileMap node named "TileMap" exists in the scene
	#var tilemap = get_node("TileMap2D")
	#var tile_pos = tilemap.world_to_map(global_position)
	#var tile_id = tilemap.get_cellv(tile_pos)
	## Assuming stair tile has an ID of 1
	#return tile_id == 1

#func adjust_y_bias():
	## Adjust the Y-bias based on direction and some bias factor, e.g., 20
	#if velocity.y < 0:  # Going up
		#velocity.y -= 20
	#elif velocity.y > 0:  # Going down
		#velocity.y += 20
