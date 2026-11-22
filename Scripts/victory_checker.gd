extends Node

func _ready ():
	GlobalSignals.OnDefeatEnemy.connect(_on_enemy_defeated)

func _on_enemy_defeated (defeated : Enemy):
	for e in get_tree().get_nodes_in_group("Enemies"):
		if e != defeated and not e.is_queued_for_deletion():
			return
	get_tree().change_scene_to_file.call_deferred("res://Scenes/victory.tscn")
