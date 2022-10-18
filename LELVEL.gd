extends Node2D

var Player_Score = 0
var IA_Score = 0
var tiempo = 60

func _ready():
	_restart_game()
	$Tiempo.text = str(tiempo)


func _process(delta):
	$Marcador_player.text = str(Player_Score)
	$Marcador_IA.text = str(IA_Score)
	timeout(delta)

func _restart_game():
	$Pelota.is_moving = false
	$Pelota.direccion = Vector2.ZERO
	$Pelota.position = Vector2(1280/2,720/2)
	#$Pelota.reset_ball()
	$Res_Timer.start()


func _on_Arco_izq_body_entered(body):
	if body is Pelota:
		IA_Score += 1
		_restart_game()
	

func _on_Arco_der_body_entered(body):
	if body is Pelota:
		Player_Score += 1
		_restart_game()

func timeout(delta):
	
	if tiempo < 0:
		if Player_Score > IA_Score:
			$Tiempo.text = "Ganaste"
		else:
			$Tiempo.text = "Mejor Suerte para la proxima"
		get_tree().paused = !get_tree().paused
		
	else:
		tiempo -= 1 * delta
		$Tiempo.text = "Time: " + str(round(tiempo))

