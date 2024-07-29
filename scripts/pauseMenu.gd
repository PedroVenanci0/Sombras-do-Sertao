extends CanvasLayer
@onready var resumeButton = $Buttons/ResumeButton
var pressed = 0

func resumePressed():
	get_tree().paused = false
	$All.visible = false

func exitPressed():
	get_tree().paused = false
	Global.fadeTransition("titlescreen")


func acessButtonpressed():
	$All.visible = true
	get_tree().paused = true

func _on_acess_button_mouse_entered():
	Global.moviement_click = false
	$AcessButton.modulate = Color(255,255,255,255)


func acessButtonMouseExited():
	Global.moviement_click = true
	$AcessButton.modulate = Color(1,1,1,0.2)
