extends KinematicBody2D

var speed = 400

onready var pelota = get_parent().find_node("Pelota")

func _ready():
	pass

func _physics_process(delta):
	var direccion = Vector2(0, _get_direction())
	move_and_slide(direccion * speed)

func _get_direction():
	if abs(pelota.position.y - position.y) > 25:
		if pelota.position.y > position.y:
			return 1
		else:
			return -1
	else:
		return 0
		
