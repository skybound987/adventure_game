class_name BattleManager
extends Node2D
@export var command_scene: PackedScene

var character1_ready = false
var hit_points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	floating_combat_damage(hit_points)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func floating_combat_damage(hit_points, duration = 1.0):
	$Damage.text = str(hit_points)
	var tween = get_tree().create_tween()
	
	tween.tween_property($Damage, "modulate", Color.RED, .2)
	tween.tween_property($Damage, "scale", Vector2(), .2)
	tween.tween_callback($Damage.queue_free)


func on_Character1_Timer_timeout(index):
	character1_ready = true
