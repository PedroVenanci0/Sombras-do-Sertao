extends TileMap
const SPEED = 25
var colliding : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if colliding:
		position.y += SPEED * delta
	else:
		pass

func _on_area_2d_body_entered(body):
	$CollisionFall/CollisionShape2D.set_deferred("disabled", true)
	colliding = true
	
func _on_collision_shake_body_entered(body):
	Global.cameraShake = true
	print("Entrei")

func _on_collision_shake_body_exited(body):
	print("Sai")
	Global.cameraShake = false
