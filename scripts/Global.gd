extends Node

var dialogfinishe: bool = true
var moviement_click: bool = true
var speed = 250.0
var TileMapWitdh = 950
var cameraShake : bool = false
## Database de cenas em preload
var scenesDatabae : Dictionary = {
	"titlescreen" : preload("res://scenes/titlescreen.tscn"),
	"world" : preload("res://scenes/world.tscn"),
	"casa" : preload("res://scenes/casa_abandonada.tscn")
}

func fadeTransition(sceneCalled):
	## Cena instanciada do fade
	var _fade = preload("res://scenes/fadeInLayer.tscn").instantiate()
	
	## Atribuição da proxima cena e adição do fade ao fluxo atual
	_fade.nextScene = scenesDatabae.get(sceneCalled)
	get_parent().add_child(_fade)
	
