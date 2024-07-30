extends CanvasLayer

var moveTryAgain = false

func _ready():
	print(get_parent().get_parent().name)
	Songs.musicPlayer.stop()
	visible = true
	
	var _tween = get_tree().create_tween()
	await _tween.tween_property($ColorRect,"modulate",Color(255,255,255,1),1).set_trans(Tween.TRANS_SINE)


func tryAgainPressed():
	if get_parent().get_parent().get_parent().name == "Casa_Abandonada":
		Songs.playMusic(1)
	elif get_parent().get_parent().name == "RandomWorld":
		Songs.playMusic(2)
		
	Global.reloadGlobal()
	get_tree().reload_current_scene()


func exitPressed():
	Songs.playMusic(1)
	get_tree().paused = false
	Global.reloadGlobal()
	Global.fadeTransition("titlescreen")
