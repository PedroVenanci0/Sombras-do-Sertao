extends Node2D

@onready var luz_lampada_01 = $Light/luz_Lampada_01
@onready var luz_lampada_02 = $Light/luz_Lampada_02
@onready var luz_lampada_03 = $Light/luz_Lampada_03

@onready var timer_luzes = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	luz_lampada_03.enabled = false
	luz_lampada_02.enabled = false
