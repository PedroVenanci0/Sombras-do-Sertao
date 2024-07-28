extends Node2D


func _on_body_entered(body):
	print("entro")
	if body is Player:
		body.queue_free()
		print("mato")
