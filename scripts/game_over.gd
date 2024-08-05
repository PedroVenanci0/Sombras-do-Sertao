extends CanvasLayer

var moveTryAgain = false

func _ready():
	Songs.musicPlayer.stop()
	visible = true
	
	var _tween = get_tree().create_tween()
	await _tween.tween_property($ColorRect,"modulate",Color(255,255,255,1),1)


func tryAgainPressed():
	if get_tree().root.get_child(2).name == "Casa_Abandonada":
		Songs.playMusic(1)
	elif get_tree().root.get_child(2).name == "RandomWorld":
		Songs.playMusic(2)
		
	Global.reloadGlobal()
	get_tree().reload_current_scene()


func exitPressed():
	Songs.playMusic(1)
	get_tree().paused = false
	Global.reloadGlobal()
	Global.fadeTransition("titlescreen")
