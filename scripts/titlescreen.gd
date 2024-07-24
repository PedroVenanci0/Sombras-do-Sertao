extends Control

@onready var player = $Player
@onready var transitionCam = $TransitionCam


func _ready():
	player.onTitle = true
	player.SPEED = 100

func _process(delta):
	if player.position.x <= -178:
		var _tween = get_tree().create_tween()
		_tween.tween_property(transitionCam,"position",Vector2(-210,-55),2)
	if player.position.x <= -400:
		Global.fadeTransition("casa")

func startPressed():
	Songs.impactPlay()
	transitionCam.shakeCamera()
	var _tween = get_tree().create_tween()
	var _tweenScale = get_tree().create_tween()
	var _zommTween = get_tree().create_tween()
	var _modulateTween = get_tree().create_tween()
	var _modulateTween2 = get_tree().create_tween()
	_tween.tween_property(transitionCam,"position",Vector2(9,-55),3)
	_zommTween.tween_property(transitionCam,"zoom",Vector2(2.5,2.5),3)
	_modulateTween.tween_property($Clique,"modulate",Color(1,1,1,1),2).set_delay(4)
	_modulateTween.tween_property($Clique,"modulate",Color(1,1,1,0),2).set_delay(4)
	await _modulateTween2.tween_property($GameName,"modulate",Color(1,1,1,0),3).finished
	player.Destination = Vector2(217,57)
	player.onTitle = false
	$GameName.visible = false
	

func exitPressed():
	get_tree().quit()
