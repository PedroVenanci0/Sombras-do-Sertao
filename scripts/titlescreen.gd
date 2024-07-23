extends Control

func _ready():
	$Player.onTitle = true
	$Player.SPEED = 100

func startPressed():
	Songs.impactPlay()
	get_node("TransitionCam").shakeCamera()
	var _tween = get_tree().create_tween()
	var _zommTween = get_tree().create_tween()
	var _modulateTween = get_tree().create_tween()
	_tween.tween_property($TransitionCam,"position",Vector2(9,-64),3)
	_zommTween.tween_property($TransitionCam,"zoom",Vector2(2.5,2.5),3).finished
	await _modulateTween.tween_property($GameName,"modulate",Color(1,1,1,0),3).finished
	$Player.Destination = Vector2(217,57)
	$Player.onTitle = false
	$GameName.visible = false
	

func exitPressed():
	get_tree().quit()
