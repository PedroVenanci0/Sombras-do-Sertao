extends CanvasLayer

var nextScene : PackedScene = null

func _ready():
	var _tween = get_tree().create_tween()
	_tween.tween_property($ColorRect,"color",Color(0,0,0,1),0.5).finished

func _process(delta):
	if $ColorRect.color.a == 1:
		get_tree().change_scene_to_packed(nextScene)
		queue_free()
