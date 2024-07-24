extends Node2D

const SPEED: float = 1000.0
const TILEMAP_WIDTH: float = 900.0  # Substitua pelo tamanho correto do seu tilemap

@export var camera: Camera2D
var tilemap_instances: Array[Node2D] = []
var dictionary: Dictionary

func _ready() -> void:
	dictionary = {
		"1": preload("res://scenes/map_1.tscn"),
		"2": preload("res://scenes/map_2.tscn")
	}
	_add_random_tilemap()

func _process(delta: float) -> void:
	# Move todos os tilemaps para a esquerda
	for tilemap in tilemap_instances:
		tilemap.position.x -= SPEED * delta
		
		# Se o tilemap sair da tela, remove-o
		if tilemap.position.x < -TILEMAP_WIDTH:
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
		scene.position = Vector2(last_tilemap.position.x + TILEMAP_WIDTH, 0)
	else:
		scene.position = Vector2(0, 0)
	
	tilemap_instances.append(scene)
