extends Control


export var level:PackedScene
export var lastlevel := false

func _on_Button_button_up():
	
		get_tree().change_scene_to(level)

		

func _on_Button2_button_up():
	get_tree().quit()
