extends Area2D

var bullet

var is_attractor = 1
var force = 500

export var mass = 10

func _physics_process(delta):
		
	if bullet:
		var dir = (global_position - bullet.global_position).normalized()
		bullet.apply_central_impulse(dir* force)



func _on_Area2D_body_entered(body):
	bullet = body

#
func _on_Area2D_body_exited(body):
	bullet = null
	
	
	
	
