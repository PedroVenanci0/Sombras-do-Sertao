extends CanvasLayer

var moveTryAgain = false

func _ready():
	Songs.musicPlayer.stop()
	visible = true
	
	var _tween = get_tree().create_tween()
	await _tween.tween_property($ColorRect,"modulate",Color(255,255,255,1),1).set_trans(Tween.TRANS_SINE)


func tryAgainPressed():
	Songs.musicPlayer.play()
	get_tree().reload_current_scene()


func exitPressed():
	get_tree().quit()
