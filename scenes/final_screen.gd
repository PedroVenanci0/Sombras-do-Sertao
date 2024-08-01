extends Node2D

func _ready():
	Songs.playMusic(1)


func _process(delta):
	await get_tree().create_timer(4).timeout
	$Credits.position.y -= 1 

	if $Credits.position.y <= -1675:
		$Thx.modulate.a += 0.005


func _on_button_pressed():
	Songs.playMusic(1)
	get_tree().paused = false
	Global.reloadGlobal()
	Global.fadeTransition("titlescreen")
