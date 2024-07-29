extends Node2D


func _on_body_entered(body):
	var gameOver = preload("res://scenes/game_over.tscn").instantiate()
	
	print("entro")
	if body is Player:
		body.isDead = true
		await get_tree().create_timer(1).timeout
		add_child(gameOver)
		print("mato")
