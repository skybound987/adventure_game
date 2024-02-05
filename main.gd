extends Node

@export var follower_scene: PackedScene
var follower

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_follower()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	
func spawn_follower():
	follower = follower_scene.instantiate()
	follower.global_position = Vector2(100,100)
	add_child(follower)

	
