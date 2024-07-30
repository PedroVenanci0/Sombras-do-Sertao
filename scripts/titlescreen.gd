extends Control

@onready var player = $Player
@onready var transitionCam = $TransitionCam
var onCaramelo = false


func _ready():
	Songs.musicNum = 1
	var _tween = get_tree().create_tween()
	player.onTitle = true
	player.SPEED = 100
	await _tween.tween_property(transitionCam,"position",Vector2(-66,-170),3).set_trans(Tween.TRANS_CUBIC).finished
	$GameName/Buttons/StartButton.set_mouse_filter(Control.MOUSE_FILTER_STOP)
	$GameName/Buttons/ExitButton.set_mouse_filter(Control.MOUSE_FILTER_STOP)
	player.visible = true
	


func _process(delta):
	if player.position.x <= -178:
		var _tween = get_tree().create_tween()
		_tween.tween_property(transitionCam,"position",Vector2(-210,-55),2)
	if player.position.x <= -400:
		Songs.playSFX(preload("res://assets/songs/SOM DE PORTA ABRINDO.mp3"))
		Global.fadeTransition("casa")
		
	if Input.is_action_just_pressed("Click_Button") and onCaramelo:
		Songs.playSFX(preload("res://assets/songs/Latido.mp3"))
		

func startPressed():
	$GameName/Buttons/StartButton.set_mouse_filter(Control.MOUSE_FILTER_IGNORE)
	$GameName/Buttons/ExitButton.set_mouse_filter(Control.MOUSE_FILTER_IGNORE)
	Songs.playSFX(preload("res://assets/songs/impact/06 - Impact.mp3"))
	transitionCam.shakeCamera()
	var _tween = get_tree().create_tween()
	var _tweenScale = get_tree().create_tween()
	var _zommTween = get_tree().create_tween()
	var _modulateTween = get_tree().create_tween()
	var _modulateTween2 = get_tree().create_tween()
	_tween.tween_property(transitionCam,"position",Vector2(9,-55),3)
	_zommTween.tween_property(transitionCam,"zoom",Vector2(2.5,2.5),3)
	_modulateTween.tween_property($Clique,"modulate",Color(1,1,1,1),2).set_delay(4)
	_modulateTween.tween_property($Clique,"modulate",Color(1,1,1,0),2).set_delay(2)
	await _modulateTween2.tween_property($GameName,"modulate",Color(1,1,1,0),3).finished
	player.Destination = Vector2(217,57)
	player.onTitle = false
	$GameName.visible = false
	

func exitPressed():
	get_tree().quit()


func caramelMouseEntered():
	onCaramelo = true
	Global.moviement_click = false

func caramelMouseExited():
	onCaramelo = false
	Global.moviement_click = true
