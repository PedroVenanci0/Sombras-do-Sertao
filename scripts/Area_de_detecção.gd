extends Node2D

@onready var label = $Label
@onready var timer = $Timer
@onready var texture_rect = $TextureRect

var _msg: String = ""

var msgShow: Array = [
	"& Catapimbas, deixaram o café esfriar. &",
	"& Lua bonita da peste desse meu sertão!!! Deus estava inspirada quando desenhou isso. &",
	"& Já esse Quadro poderia ser melhor, mas pelo menos representa a seca do velho nordeste. &",
	"& Picanha do lula?? Faz o L!!. &",
]

func _ready():
	set_process(false)

func _process(delta):
	if Input.is_action_just_pressed("Click_Button"):
		match get_parent().name:
			"Garrafa":
				_msg = msgShow[0]
				show_message(_msg)
				texture_rect.visible = false
			"Lua":
				_msg = msgShow[1]
				show_message(_msg)
				texture_rect.visible = false
			"Quadro":
				_msg = msgShow[2]
				show_message(_msg)
				texture_rect.visible = false
			"Monstro":
				pass
		 
func _on_texture_rect_mouse_entered():
	set_process(true)


func show_message(_msg):
	
	#if not timer.is_stopped():
		#text.visible_characters = text.text.length()
		#return
		
	if msgShow.size() == 0:
		hide()
		return
	
	label.visible_characters = 0
	label.text = _msg
	timer.start()

func _on_timer_timeout():
	
	if label.visible_characters == label.text.length():
		timer.stop()
		await get_tree().create_timer(5).timeout
		label.visible = false
	else:
		label.visible_characters += 1	

func _on_texture_rect_mouse_exited():
	set_process(false)
