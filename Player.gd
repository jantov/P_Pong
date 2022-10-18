extends KinematicBody2D

var speed = 300

func _physics_process(delta):
	var direccion = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direccion.y -= 1
	if Input.is_action_pressed("ui_down"):
		direccion.y += 1
		
	move_and_slide(direccion * speed)
