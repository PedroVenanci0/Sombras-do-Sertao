extends Node
## Variavel para definir se player esta fugindo
var inEscape: bool = false
## Variavel para definir se o player esta correndo
var isRun: bool = false
var dialogFinished: bool = true
var moviement_click: bool = true
var speed = 200.0
var TileMapWitdh = 950
var cameraShake : bool = false

## Referência do nó do Player
var playerRef: Player = null;

## Database de cenas em preload
var scenesDatabae : Dictionary = {
	"titlescreen" : preload("res://scenes/titlescreen.tscn"),
	"world" : preload("res://scenes/world.tscn"),
	"casa" : preload("res://scenes/casa_abandonada.tscn"),
	"run" : preload("res://scenes/random_world.tscn"),
	"final" : preload("res://scenes/final_screen.tscn")
}

func fadeTransition(sceneCalled):
	## Cena instanciada do fade
	var _fade = preload("res://scenes/fadeInLayer.tscn").instantiate()
	
	## Atribuição da proxima cena e adição do fade ao fluxo atual
	_fade.nextScene = scenesDatabae.get(sceneCalled)
	get_parent().add_child(_fade)
	
func reloadGlobal():
	AudioServer.set_bus_volume_db(0,-0.3)
	AudioServer.set_bus_volume_db(1,2.1)
	AudioServer.set_bus_volume_db(2,-4.1)
	inEscape = false
	isRun = false
	dialogFinished = true
	moviement_click = true
	speed = 250.0
	TileMapWitdh = 950
	cameraShake = false
	
