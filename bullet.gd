extends RigidBody2D

export(int, -1, 1, 2) var color = 1
var force = 2000
export var ghost:PackedScene
var dir

var shooted = false

func _ready():
	Global.color = color
	modulate = Color.blue
func _physics_process(delta):
	
	
	if Input.is_action_just_released("r"):
		Global.shoot = false
		get_tree().reload_current_scene()
	
	switch()
	if !Global.shoot:
		dir = (get_global_mouse_position() - global_position).normalized()
	if Input.is_action_just_pressed("mouse_left") and !Global.shoot:
		Global.shoot = true
	yield(get_tree().create_timer(0.1), "timeout")
	if Input.is_action_just_released("mouse_left") and !shooted:
		shooted = true
		$AudioStreamPlayer2D.play()
		$CPUParticles2D.emitting = true
		Global.shooted = true
		apply_central_impulse(dir * force)

func viz():
	if !Global.shoot:
		var v = ghost.instance() as RigidBody2D
		v.modulate = modulate
		get_tree().root.add_child(v)
		v.global_position = global_position
		v.ghost()

func _on_viz_timeout():
	viz()
	
func switch():
	if Input.is_action_just_released("tab"):
		if color == 1:
			color = -1
			modulate = Color.red
		else:
			color = 1
			modulate = Color.blue
		Global.color = color
