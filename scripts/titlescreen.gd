extends Control

@onready var startButton = $Buttons/StartButton

func startPressed():
	Songs.impactPlay()
	$TransitionCam.shakeCamera()
	var _tween = get_tree().create_tween()
	_tween.tween_property(self,"modulate",Color(1,1,1,0),3)

func exitPressed():
	get_tree().quit()
