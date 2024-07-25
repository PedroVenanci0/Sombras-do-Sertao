extends Sprite2D

const SPEED = 200.0
const RESET_POSITION = Vector2(1850, -200) # Posição para onde o sprite deve retornar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	position.x -= SPEED * delta
	if position.x < -300:
		position = RESET_POSITION
