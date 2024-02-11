class_name BattleManager
extends Node2D
@export var command_scene: PackedScene

var character1_ready = false
var hit_points = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	command_window_display()
	pass

func command_window_display():
	var command_window_instance = command_scene.instantiate()
	command_window_instance.position = $WindowPosition.global_position
	get_tree().root.add_child(command_window_instance)
	command_window_instance.display_command_window()
	


func on_Character1_Timer_timeout(index):
	character1_ready = true
