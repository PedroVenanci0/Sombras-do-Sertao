extends Node2D

@onready var label = %PlayerLabel
@onready var timer = $Timer
@onready var texture_rect = $TextureRect

@onready var monster = %Monster
var speed_monster = 75

@onready var player = %Player

@onready var camera_2d_2 = %Camera2D2

@onready var luz_lampada_01 = %luz_Lampada_01
@onready var luz_lampada_02 = %luz_Lampada_02
@onready var luz_lampada_03 = %luz_Lampada_03

@onready var ponto_luz = %PontoLuz
@onready var ponto_luz_2 = %PontoLuz2
@onready var ponto_luz_4 = %PontoLuz4
@onready var ponto_luz_5 = %PontoLuz5
@onready var ponto_luz_6 = %PontoLuz6
@onready var ponto_luz_3 = %PontoLuz3
@onready var ponto_luz_7 = %PontoLuz7

var _msg: String = ""
var openDor = false
var monsterclick: bool = false

var msgShow: Array = [
	
	"& Armaria, café bom danado desse jogado\naqui e ainda deixaram a xica suja!! &",
	"& Lua bonita da peste desse meu sertão!!!\nDeus estava inspirado quando desenhou essa\nbelezura. &",
	"& Já esse quadro poderia ser melhor,\n mas pelo menos representa o velho nordeste. &",
	"& Picanha do lula?? Faz o L!!. &",
	"& DIABO!!! FI DO CABRUNCO\nRAI DE PERTO DE MIM BATORÈ!!! &",
	"& Éguaa!!! Mas eu tõ emperiquitado\nde bunito nesse espei fi &",
	"& Armaria, Cana arretada da peste!! \nToma até uma dose. &",
	"& Mãinha dizia que Lampião era bicho bruto,\n há de nascer homi mai corajoso que lampião.\nDês de miudo quero ser um,tenho medo nem do cão!! &"
	
]

func _ready():
	set_process(false)
	set_physics_process(false)
	player.SPEED = 200

func _process(delta):
	
	if Input.is_action_just_pressed("Click_Button") and Global.dialogFinished:
		match get_parent().name:
			
			"Garrafa":
				Songs.playSFX(preload("res://assets/songs/Falas Sombras do Sertão/café.mp3"))
				Global.dialogFinished = false
				player.onTitle = true
				_msg = msgShow[0]
				show_message(_msg)
				texture_rect.queue_free()
				await get_tree().create_timer(10).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_3,"modulate",Color(1,1,1,0),0.5)
				
			"Lua":
				Songs.playSFX(preload("res://assets/songs/Falas Sombras do Sertão/Lua.mp3"))
				Global.dialogFinished = false
				player.onTitle = true
				_msg = msgShow[1]
				show_message(_msg)
				texture_rect.queue_free()
				await get_tree().create_timer(10).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_6,"modulate",Color(1,1,1,0),0.5)
				
			"Quadro":
				Songs.playSFX(preload("res://assets/songs/Falas Sombras do Sertão/Quadro.mp3"))
				Global.dialogFinished = false
				player.onTitle = true
				_msg = msgShow[2]
				show_message(_msg)
				texture_rect.queue_free()
				await get_tree().create_timer(14).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz,"modulate",Color(1,1,1,0),0.5)
				
			"Monster":
				monsterclick = true
				Songs.musicPlayer.stop()
				AudioServer.set_bus_volume_db(1,10)
				Songs.playSFX(preload("res://assets/songs/impact/05 - Impact.mp3"))
				label.add_theme_color_override("font_color",Color(255,0,0,1))
				var animated_sprite_2d: AnimatedSprite2D = get_parent().get_node("AnimatedSprite2D")
				Global.dialogFinished = false
				player.onTitle = true
				camera_2d_2.shakeCamera()
				texture_rect.queue_free()
				lightblink()
				await get_tree().create_timer(2).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_7,"modulate",Color(1,1,1,0),0.5)
				animated_sprite_2d.get_parent().get_node("Deathzone").position.y = 125
				animated_sprite_2d.position.y = 125
				animated_sprite_2d.play("Spawn")
				Songs.playSFX(preload("res://assets/songs/Monster Growl.mp3"))
				await animated_sprite_2d.animation_finished
				luz_lampada_02.enabled = true
				luz_lampada_03.enabled = true
				animated_sprite_2d.play("idle")
				_msg = msgShow[4]
				show_message(_msg)
				Songs.playSFX(preload("res://assets/songs/Falas Sombras do Sertão/Monstro.mp3"))
				await get_tree().create_timer(1).timeout
				Songs.playMusic(2)
				AudioServer.set_bus_volume_db(1,2)
				player.onTitle = false
				animated_sprite_2d.play("walk")
				set_physics_process(true)
				Global.isRun = true
				player.SPEED += 75
				openDor = true
				
			"Espelho":
				Songs.playSFX(preload("res://assets/songs/Falas Sombras do Sertão/Espei.mp3"))
				Global.dialogFinished = false
				player.onTitle = true
				_msg = msgShow[5]
				show_message(_msg)
				texture_rect.queue_free()
				await get_tree().create_timer(6).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_5,"modulate",Color(1,1,1,0),0.5)

			"Pitu":
				Songs.playSFX(preload("res://assets/songs/Falas Sombras do Sertão/Pinga.mp3"))
				Global.dialogFinished = false
				player.onTitle = true
				_msg = msgShow[6]
				show_message(_msg)
				texture_rect.queue_free()
				await get_tree().create_timer(5).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_2,"modulate",Color(1,1,1,0),0.5)
				
			"CangaçoParede":
				Songs.playSFX(preload("res://assets/songs/Falas Sombras do Sertão/Lampião.mp3"))
				Global.dialogFinished = false
				player.onTitle = true
				_msg = msgShow[7]
				show_message(_msg)
				texture_rect.queue_free()
				await get_tree().create_timer(13).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_4,"modulate",Color(1,1,1,0),0.5)
	

func _physics_process(delta):
	monster.position.x += 3
	
	if player.position >= Vector2(1330,260) and openDor:
		Songs.playSFX(preload("res://assets/songs/SOM DE PORTA ABRINDO.mp3"))
		Global.fadeTransition("run")

func _on_texture_rect_mouse_entered():
	var material = get_parent().material
	if material is ShaderMaterial:
		# Define o valor de um parâmetro do shader
		material.set_shader_parameter("hovered", true)
	else:
		print("O material não é um ShaderMaterial")
		
	Global.moviement_click = false
	set_process(true)

func show_message(_msg):
	
	#if not timer.is_stopped():
		#label.visible_characters = label.text.length()
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
		await get_tree().create_timer(3).timeout
		label.text = ""
		player.onTitle = false
		if monsterclick:
			Global.dialogFinished = false
		else:
			Global.dialogFinished = true
	else:
		label.visible_characters += 1	

func _on_texture_rect_mouse_exited():
	var material = get_parent().material
	if material is ShaderMaterial:
		# Define o valor de um parâmetro do shader
		material.set_shader_parameter("hovered", false)
	else:
		print("O material não é um ShaderMaterial")
	
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
