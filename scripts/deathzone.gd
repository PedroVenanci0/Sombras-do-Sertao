extends Node2D
	
func _on_body_entered(body):
	var gameOver = preload("res://scenes/game_over.tscn").instantiate()
	var jumpscare = preload("res://scenes/jumpscare.tscn").instantiate()
	
	if body is Player and not body.isDead:
		if get_parent().name == "Monster":
			get_parent().visible = false
			add_child(jumpscare)
			
		elif get_parent().name == "Cacto":
			var _colorTerror = get_parent().get_parent().get_parent().get_node("ColorRect")
			var _camera = get_parent().get_parent().get_parent().get_node("Camera2D")
			var _tween = get_tree().create_tween()
			var _tween2 = get_tree().create_tween()
			Global.speed = 0
			Global.cameraShake = true
			Global.inEscape = false
			body.SPEED = 0
			_tween.tween_property(_colorTerror, "color", Color(0.0, 0.0, 0.0, 0.7), 1.5).set_trans(Tween.TRANS_LINEAR)
			await _tween2.tween_property(_camera,"zoom",Vector2(3.0,3.0),1.5).set_trans(Tween.TRANS_CUBIC).finished
			add_child(jumpscare)
			
		get_tree().root.get_child(2).add_child(gameOver)
		body.isDead = true
		await get_tree().create_timer(1).timeout
	
		
