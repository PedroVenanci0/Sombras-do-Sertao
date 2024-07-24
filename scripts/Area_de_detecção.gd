extends Node2D

@onready var label = $Label
@onready var timer = $Timer
@onready var texture_rect = $TextureRect

@onready var monster = %Monster

@onready var player = %Player

@onready var camera_2d_2 = %Camera2D2

@onready var animated_sprite_2d: AnimatedSprite2D = get_parent().get_node("AnimatedSprite2D")


@onready var luz_lampada_01 = %luz_Lampada_01
@onready var luz_lampada_02 = %luz_Lampada_02
@onready var luz_lampada_03 = %luz_Lampada_03



var _msg: String = ""

var msgShow: Array = [
	
	"& Catapimbas, deixaram o café esfriar. &",
	"& Lua bonita da peste desse meu sertão!!!\nDeus estava inspirada quando desenhou essa\nbelezura. &",
	"& Já esse Quadro poderia ser melhor, mas pelo menos,\nrepresenta a seca do velho nordeste. &",
	"& Picanha do lula?? Faz o L!!. &",
	"& DIABO!!! FI DO CABRUNCO\nRAI DE PERTO DE MIM!!! &",
	"& Éguaa!!! mas eu tõ Emperiquitado\nde bunito nesse espei fi &",
	"& Armaria, Cana arretada da peste!! Toma até outa dose. &",
	"& Você pensa que cachaça é água. Cachaça não é água não. Cachaça vem do alambique. E água vem do ribeirão. Sempre preferi o alambique."
]

func _ready():
	set_process(false)

func _process(delta):
	if Input.is_action_just_pressed("Click_Button"):
		match get_parent().name:
			"Garrafa":
				_msg = msgShow[0]
				show_message(_msg)
				texture_rect.queue_free()
			"Lua":
				_msg = msgShow[1]
				show_message(_msg)
				texture_rect.queue_free()
			"Quadro":
				_msg = msgShow[2]
				show_message(_msg)
				texture_rect.queue_free()
			"Monster":
				player.onTitle = true
				camera_2d_2.shakeCamera()
				texture_rect.queue_free()
				lightblink()
				await get_tree().create_timer(2).timeout
				animated_sprite_2d.position.y = 125
				animated_sprite_2d.play("Spawn")
				await animated_sprite_2d.animation_finished
				luz_lampada_02.enabled = true
				luz_lampada_03.enabled = true
				animated_sprite_2d.play("idle")
				_msg = msgShow[4]
				show_message(_msg)
				player.onTitle = false
			"Espelho":
				_msg = msgShow[5]
				show_message(_msg)
				texture_rect.queue_free()
			"Pitu":
				_msg = msgShow[6]
				show_message(_msg)
				texture_rect.queue_free()
			"Filtro_de_barro":
				_msg = msgShow[7]
				show_message(_msg)
				texture_rect.queue_free()
				
	
				
func _on_texture_rect_mouse_entered():
	Global.moviement_click = false
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
	Global.moviement_click = true

func lightblink():
	
	for i in range(5):
		luz_lampada_03.enabled = true
		luz_lampada_02.enabled =  false
		await get_tree().create_timer(0.1).timeout
		luz_lampada_02.enabled = true
		luz_lampada_03.enabled = false
		await get_tree().create_timer(0.2).timeout
	
	luz_lampada_03.enabled = false
	luz_lampada_02.enabled =  false
