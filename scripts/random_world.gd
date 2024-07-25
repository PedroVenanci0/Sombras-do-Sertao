extends Node2D

@export var camera: Camera2D
var tilemap_instances: Array[Node2D] = []
var dictionary: Dictionary

func _ready() -> void:
	Global.TileMapWitdh = 950.0
	Global.speed = 250.0
	dictionary = {
		"1": preload("res://scenes/map_1.tscn"),
		"2": preload("res://scenes/map_2.tscn"),
		"3" : preload("res://scenes/map_3.tscn"),
		"4" : preload("res://scenes/map_4.tscn")
	}
	_add_random_tilemap()

func _process(delta: float) -> void:
	# Move todos os tilemaps para a esquerda
	for tilemap in tilemap_instances:
		tilemap.position.x -= Global.speed * delta
		
		# Se o tilemap sair da tela, remove-o
		if tilemap.position.x < -Global.TileMapWitdh:
			tilemap.queue_free()
			tilemap_instances.erase(tilemap)

	# Adiciona novos tilemaps se necessário
	if tilemap_instances.size() == 0 or tilemap_instances[-1].position.x < get_viewport().size.x:
		_add_random_tilemap()

func _add_random_tilemap() -> void:
	var keys = dictionary.keys()
	var _key = keys[randi() % keys.size()]
	
	# Instancia a cena correspondente
	var scene = dictionary[_key].instantiate()
	add_child(scene)
	
	# Define a posição do novo tilemap
	if tilemap_instances.size() > 0:
		var last_tilemap = tilemap_instances[-1]
		scene.position = Vector2(last_tilemap.position.x + Global.TileMapWitdh, 0)
	else:
		scene.position = Vector2(0, 0)
	
	tilemap_instances.append(scene)


func _on_timer_timeout():
	if Global.speed <= 650:
		Global.speed += 10
		
	if Global.TileMapWitdh <= 1150:
		Global.TileMapWitdh += 10
