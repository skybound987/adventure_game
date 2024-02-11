class_name BattleManager
extends Node2D

var character1_ready = false
var enemy1_ready = false
var hit_points = 0
var command_labels = []
var selected_command_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	command_labels = [
		$CommandWindow/Attack,
		$CommandWindow/Magic,
		$CommandWindow/Item
	]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	command_window_display()
	if character1_ready:
		if Input.is_action_just_pressed("move_up"):
			cycle_command_selection()
			$CommandSelect.play()
		elif Input.is_action_just_pressed("move_down"):
			cycle_command_selection()
			$CommandSelect.play()

func command_window_display():
	$CommandWindow.position = $WindowPosition.global_position
	$CommandWindow/ProgressBar.value = ($Character1_Timer.wait_time - $Character1_Timer.time_left)
	

func cycle_command_selection():
	selected_command_index = (selected_command_index + 1) % command_labels.size()
	_begin_command_selection()
		
func _begin_command_selection():
	for i in range(command_labels.size()):
		if i == selected_command_index:
			command_labels[i].add_theme_color_override("font_color", Color(0, 255, 0))
		else:
			command_labels[i].add_theme_color_override("font_color", Color(255, 255, 255))
		
func on_Character1_Timer_timeout():
	character1_ready = true
	$Character1_Ready.play()
	print("Player 1 Ready...")

func on_Enemy1_Timer_timeout():
	enemy1_ready = true
