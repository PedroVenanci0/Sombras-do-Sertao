extends Node

## Database de cenas em preload
var scenesDatabae : Dictionary = {
	"titlescreen" : preload("res://scenes/titlescreen.tscn"),
	"World" : preload("res://scenes/world.tscn")
}

func fadeTransition(sceneCalled):
	
	## Cena instanciada do fade
	var _fade = preload("res://scenes/fadeInLayer.tscn").instantiate()
	
	## Atribuição da proxima cena e adição do fade ao fluxo atual
	_fade.nextScene = scenesDatabae.get(sceneCalled)
	get_parent().add_child(_fade)
