extends AnimatedSprite2D

@onready var luz_lampada = %luz_Lampada

func _ready():
	rotate_right()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if luz_lampada.rotation <= -0.019:
		rotate_right()
	elif luz_lampada.rotation >= 0.019:
		rotate_left()

func rotate_left():
	var tween = get_tree().create_tween()
	tween.tween_property(luz_lampada,"rotation",-0.02,0.6)
	
func rotate_right():
	var tween = get_tree().create_tween()
	tween.tween_property(luz_lampada,"rotation",0.02,0.6)
