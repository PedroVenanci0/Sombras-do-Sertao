extends Node2D

@onready var luz_lampada_03 = $Light/luz_Lampada_03
@onready var luz_lampada_02 = $Light/luz_Lampada_02
@onready var area_2d = $Area2D

func _ready():
	%Player.Destination = Vector2(1300,227)

func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	pass
