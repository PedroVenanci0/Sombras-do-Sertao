extends Control

@onready var player = $Player
@onready var transitionCam = $TransitionCam
var onCaramelo = false

func _ready():
	Songs.playMusic(1)
	var tween = get_tree().create_tween()
	player.onTitle = true
	player.SPEED = 100
	
	await tween.tween_property(transitionCam, "position", Vector2(-66, -170), 3).set_trans(Tween.TRANS_CUBIC).finished
	$GameName/Buttons/StartButton.set_mouse_filter(Control.MOUSE_FILTER_STOP)
	$GameName/Buttons/ExitButton.set_mouse_filter(Control.MOUSE_FILTER_STOP)
	player.visible = true

func _process(delta):
	if player.position.x <= -178:
		var tween = get_tree().create_tween()
		tween.tween_property(transitionCam, "position", Vector2(-210, -55), 2)
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

	var tween = get_tree().create_tween()

	# Anima a posição da câmera e o zoom simultaneamente
	tween.parallel().tween_property(transitionCam, "position", Vector2(9, -55), 3)
	tween.parallel().tween_property(transitionCam, "zoom", Vector2(2.5, 2.5), 3)
	
	# Anima a opacidade do nome do jogo
	tween.parallel().tween_property($GameName, "modulate", Color(1, 1, 1, 0), 3)
	
	# Anima a opacidade do objeto 'Clique'
	tween.parallel().tween_property($Clique, "modulate", Color(1, 1, 1, 1), 2).set_delay(3)
	tween.tween_property($Clique, "modulate", Color(1, 1, 1, 0), 2).set_delay(3)
	
	await get_tree().create_timer(4).timeout

	# Define a ordem de movimento do jogador e seu destino
	player.moveOrder = true
	player.Destination = Vector2(217, 57)
	print(player.Destination)
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
