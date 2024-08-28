extends Node2D
var changeScene = false
var moveCamera = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CutscenePlayer").firstCutscene = true
	get_node("CutsceneMonster").firstCutscene = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moveCamera:
		var camera = get_node("Camera2D")
		var _tween = create_tween()
		_tween.tween_property(camera, "position:x", 453, 2)
	if changeScene:
		global_position
		await get_tree().create_timer(1).timeout
		Global.fadeTransition("run")
