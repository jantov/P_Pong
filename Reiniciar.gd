extends Label


func _process(delta):
	restart_val()

func restart_val():
	if Input.is_key_pressed(KEY_R):
		get_tree().paused = false
		get_tree().reload_current_scene()
