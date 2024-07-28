extends Control
@onready var resumeButton = $Buttons/ResumeButton
var pressed = 0

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		pressed += 1
		visible = true
		get_tree().paused = true
		if pressed == 2:
			pressed = 0
			get_tree().paused = false
			visible = false

func resumePressed():
	get_tree().paused = false
	visible = false

func exitPressed():
	get_tree().paused = false
	Global.fadeTransition("titlescreen")
