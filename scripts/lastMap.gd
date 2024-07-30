extends TileMap

@onready var camera : Camera2D = get_parent().get_node("Camera2D")
@onready var cactos : TextureRect = get_parent().get_node("TextureRect")

func _on_area_2d_body_entered(body):
	if body is Player:
		var shader_material = cactos.material
		if shader_material is ShaderMaterial:
			shader_material.set_shader_parameter("speed", 0.0)
		get_parent().set_process(false)
		var _tween = get_tree().create_tween()
		_tween.tween_property(camera,"zoom", Vector2(2,2),1).set_trans(Tween.TRANS_CUBIC)
		get_parent().get_node("Player").speedEscape = 200


func _on_door_body_entered(body):
	if body is Player:
		Global.fadeTransition("titlescreen")
