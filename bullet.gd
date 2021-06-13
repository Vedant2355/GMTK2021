
extends RigidBody2D

var force = 2000

func _physics_process(delta):
	var dir = (get_global_mouse_position() - global_position).normalized()
	if Input.is_action_just_released("ui_accept"):
		apply_central_impulse(dir * force)
