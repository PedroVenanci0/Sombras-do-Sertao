extends Node2D

@onready var garrafa = $Objetos/Garrafa

func _ready():
	
	var material = get_node("res://Shader/outline.gdshader")

	if material is ShaderMaterial:
		material.set_shader_parameter("verific", true)

func _process(delta):
	pass
