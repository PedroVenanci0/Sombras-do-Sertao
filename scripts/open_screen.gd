extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Songs.musicPlayer.stop()
	var _tween = get_tree().create_tween()
	var _tween2 = get_tree().create_tween()
	var _tween3 = get_tree().create_tween()
	var _tween4 = get_tree().create_tween()
	
	
	_tween.tween_property($"Removebg-preview","modulate", Color(1,1,1,1),2)
	_tween2.tween_property($"Removebg-preview","modulate", Color(1,1,1,0),2).set_delay(3)
	_tween3.tween_property($Label,"modulate", Color(1,1,1,1),2).set_delay(5)
	_tween3.tween_property($Label,"modulate", Color(1,1,1,0),2)
	_tween2.tween_property($"Removebg-preview","modulate", Color(1,1,1,0),2).set_delay(6)
	await _tween4.tween_property($Headphone,"modulate", Color(1,1,1,1),2).set_delay(9).finished
	await get_tree().create_timer(2).timeout
	Global.fadeTransition("titlescreen")
	
	
