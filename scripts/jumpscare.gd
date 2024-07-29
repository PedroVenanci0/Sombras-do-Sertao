extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioServer.set_bus_volume_db(1,15)
	Songs.playSFX(preload("res://assets/songs/Jumpscare.mp3"))
	
	var _tween = get_tree().create_tween()
	
	await _tween.tween_property($MonsterWalk,"scale",Vector2(5,5),0.4).finished
	queue_free()
