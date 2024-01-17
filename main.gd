extends Node

@export var follower_scene: PackedScene
var follower

# Called when the node enters the scene tree for the first time.
func _ready():
#	var player = $Player
#	player.player_location.connect(Callable(self, "_on_Player_location_update"))
	_spawn_follower()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	
func _spawn_follower():
	follower = follower_scene.instantiate()
	add_child(follower)	

