extends KinematicBody2D
class_name Pelota

var speed = 0
var direccion = Vector2.ZERO
var is_moving = false
onready var timer = get_parent().find_node("Res_Timer")

func _ready():
	randomize()
	reset_ball()

func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(direccion * speed * delta)
		if collide:
			direccion = direccion.bounce(collide.normal)
			$Audio_coll.play()

func reset_ball():
	timer.stop()
	speed = 400
	direccion.x = [1,-1][randi() % 2]
	direccion.y = [0.8,-0.8][randi() % 2]
	is_moving = true


func _on_Res_Timer_timeout():
	reset_ball()
