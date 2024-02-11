class_name BattleManager
extends Node2D

var character1_ready = false
var enemy1_ready = false
var hit_points = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	command_window_display()
	pass

func command_window_display():
	$CommandWindow.position = $WindowPosition.global_position
	$CommandWindow/ProgressBar.value = ($Character1_Timer.wait_time - $Character1_Timer.time_left)

func on_Character1_Timer_timeout():
	character1_ready = true

func on_Enemy1_Timer_timeout():
	enemy1_ready = true
