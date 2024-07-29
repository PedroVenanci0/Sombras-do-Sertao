extends Node2D
const SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SPEED * delta


func _on_area_2d_body_entered(body):
	var gameOver = preload("res://scenes/game_over.tscn").instantiate()
	print("entro")
	if body is Player:
		body.isDead = true
		await get_tree().create_timer(1).timeout
		add_child(gameOver)
		print("mato")
