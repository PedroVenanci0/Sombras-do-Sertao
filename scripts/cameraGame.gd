extends Camera2D
var _intensity = 1
var _duration = 10
var _start_time = 0
var _rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.cameraShake:
		var ran_x = randf_range(-1,10) * _intensity 
		var ran_y = randf_range(-1,10) * _intensity 
		offset = Vector2(ran_x,ran_y)
