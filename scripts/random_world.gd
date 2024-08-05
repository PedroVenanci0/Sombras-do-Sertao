extends Node2D

@export var camera: Camera2D
var tilemap_instances: Array[Node2D] = []
var dictionary: Dictionary
var finalMap : bool = false
var firstMap : bool = true
var cameraSpeed = 200

func _ready() -> void:
	AudioServer.set_bus_volume_db(2,-4)
	var _tween = get_tree().create_tween()
	
	_tween.tween_property($Label,"modulate", Color(1,1,1,0),3).set_trans(Tween.TRANS_BACK).set_delay(2)
	Global.isRun = true
	Global.inEscape = true
	Global.TileMapWitdh = 950.0
	Global.speed = 250.0
	dictionary = {
		"1" : preload("res://scenes/map_1.tscn"),
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

func _physics_process(delta):
	var direction = $Camera2D.global_position.direction_to($Player.global_position)
	# Calcula a nova posição interpolada
	var new_position = $Camera2D.global_position + direction * cameraSpeed * delta
	# Atualiza a posição da câmera
	$Camera2D.global_position = new_position
	
	if $Player.get_node("AnimationManager").current_animation == "death":
		Global.speed = 0

func _add_random_tilemap() -> void:
	var keys = dictionary.keys()
	var _key = keys[randi() % keys.size()]
	var scene = null
	# Instancia a cena correspondente
	if firstMap:
		scene =  preload("res://scenes/firstMap.tscn").instantiate() 
		firstMap = false
	elif finalMap:
		scene =  preload("res://scenes/lastMap.tscn").instantiate() 
	else:
		scene = dictionary[_key].instantiate()
		
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


func _on_final_timer_timeout():
	finalMap = true
