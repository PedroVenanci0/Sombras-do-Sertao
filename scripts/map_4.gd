extends TileMap
const SPEED = 25
var colliding : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if colliding:
		position.y += SPEED * delta
	else:
		pass

func _on_area_2d_body_entered(body):
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	colliding = true
	
