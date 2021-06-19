extends RigidBody2D

var force = 2000

func _physics_process(delta):
	if get_colliding_bodies().size() > 0:
		queue_free()

func ghost():
	var dir =(get_global_mouse_position() - global_position).normalized()
	apply_central_impulse(dir * force)
	yield(get_tree().create_timer(3), "timeout")
	queue_free()
