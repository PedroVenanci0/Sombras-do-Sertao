extends CanvasLayer

func _ready():
	Songs.musicPlayer.stop()
	var tween = get_tree().create_tween()

	tween.parallel().tween_property($"Removebg-preview", "modulate", Color(1, 1, 1, 1), 2)
	tween.parallel().tween_property($Skip,"modulate", Color(1,1,1,1),2).set_delay(3)
	tween.parallel().tween_property($Skip,"modulate", Color(1,1,1,0),2).set_delay(8)
	tween.parallel().tween_property($"Removebg-preview", "modulate", Color(1, 1, 1, 0), 2).set_delay(3)
	tween.parallel().tween_property($Label, "modulate", Color(1, 1, 1, 1), 2).set_delay(6)
	tween.tween_property($Label, "modulate", Color(1, 1, 1, 0), 2)
	tween.tween_property($"Removebg-preview", "modulate", Color(1, 1, 1, 0), 2)
	tween.tween_property($Headphone, "modulate", Color(1, 1, 1, 1), 2)

	await tween.finished
	
	await get_tree().create_timer(2).timeout
	Global.fadeTransition("titlescreen")

func _process(delta):
	if Input.is_action_just_pressed("Click_Button"):
		Global.fadeTransition("titlescreen")
