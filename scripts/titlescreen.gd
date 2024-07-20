extends Control

@onready var startButton = $Buttons/StartButton


func _ready():
	startButton.grab_focus()

func startPressed():
	Songs.impactPlay()
	#var _tween = get_tree().create_tween()
	#await _tween.tween_property($TransitionCam,"zoom",Vector2(8,8),1).finished
	Global.fadeTransition("World")

func exitPressed():
	get_tree().quit()
