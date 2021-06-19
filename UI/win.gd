extends Area2D


export var next_level:PackedScene
export var lastlevel := false

func _on_win_body_entered(body):

	if body.name == "player":
		Global.shoot = false
		if !lastlevel:
			get_tree().change_scene_to(next_level)
		else:
			get_tree().change_scene("res://UI/main_menu.tscn")
