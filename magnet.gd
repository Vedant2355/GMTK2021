extends Area2D

var bullet
var force = 500
var can_move = false

export var left_side = true

export(int, -1, 1, 2)var is_attractor = 1
var pos
func _ready():
	
	if is_attractor == 1:
		$Line2D.default_color = Color.blue
		modulate = Color.blue
	else:
		$Line2D.default_color = Color.red
		modulate = Color.red
	
	pos = global_position
	input_pickable = true
	$Line2D.set_as_toplevel(true)
	$Line2D.global_position = global_position
	if !left_side:
		$Line2D.global_rotation_degrees = 90
		
func _physics_process(delta):
	if can_move and Input.is_action_pressed("mouse_right"):
		self.global_position = get_global_mouse_position()
	constraint()
	if bullet:
		var dir = Global.color * is_attractor * (global_position - bullet.global_position).normalized()
		bullet.apply_central_impulse(dir* force)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		bullet = body

func _on_Area2D_body_exited(body):
	bullet = null


func _on_magnate_mouse_entered():
	if Input.is_action_pressed("mouse_right"):
		return
	can_move = true

func _on_magnate_mouse_exited():
	can_move = false

func constraint():
	if left_side:
		global_position.x = clamp(global_position.x, pos.x-300,pos.x+300)
		global_position.y = pos.y
	else:
		global_position.y = clamp(global_position.y, pos.y-300,pos.y+300)
		global_position.x = pos.x
