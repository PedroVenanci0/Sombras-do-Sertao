extends TileMap

@onready var camera : Camera2D = get_parent().get_node("Camera2D")
@onready var cactos : TextureRect = get_parent().get_node("TextureRect")

func _on_area_2d_body_entered(body):
	if body is Player:
		if !Global.inEscape: return
		
		var shader_material = cactos.material
		if shader_material is ShaderMaterial:
			shader_material.set_shader_parameter("speed", 0.0)
		get_parent().set_process(false)
		var _tween = get_tree().create_tween()
		_tween.set_trans(Tween.TRANS_CUBIC);
		_tween.tween_property(camera,"zoom", Vector2(2.5,2.5),1);
		get_parent().get_node("Player").speedEscape = 125
		
		print("Player colidiu com o chão.")


func _on_door_body_entered(body):
	if body is Player:
		print("Player colidiu com a porta.")
		Songs.musicPlayer.stop()
		Global.fadeTransition("final")
		Global.inEscape = false
		Global.isRun = false
		body.Destination = body.position;
		body.speedEscape = 0
		body.velocity = Vector2.ZERO;
		
