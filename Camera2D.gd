extends Camera2D


onready var player = get_parent().get_node("player")

func _physics_process(delta):
	if Global.shoot:
		get_parent().remove_child(self)
		player.add_child(self)
		global_position = lerp(global_position, player.global_position, 0.2)
		zoom = lerp(zoom, Vector2(2, 2), 0.2)



func _process(delta):
	if Global.shooted:
		offset_h = rand_range(-1, 1) * 0.3
		offset_v = rand_range(-1, 1) * 0.3
		yield(get_tree().create_timer(0.2), "timeout")
		Global.shooted = false
		set_process(false)
