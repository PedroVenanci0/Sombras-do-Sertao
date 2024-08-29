extends Node2D
@onready var label = $"../../../Player/PlayerLabel"
@onready var timer = $Timer
@onready var texture_rect = $TextureRect

@onready var player = %Player

@onready var camera_2d_2 = %Camera2D2


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
	
	"Me chame de baianinho de mauá,\ndeixe-me pegar no seu taco!!!",
	"Cade o jogo do mengao???",
	"itaipu geladinha",
	"Tomar uma bhema na bundinha",
	"Essa antipatica é de matar"

]

func _ready():
	set_process(false)

func _process(delta):
	
	if Input.is_action_just_pressed("Click_Button") and Global.dialogFinished:
		match get_parent().name:
			
			"MesaSinuca":
				Global.dialogFinished = false
				_msg = msgShow[0]
				show_message(_msg)
				await get_tree().create_timer(10).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_3,"modulate",Color(1,1,1,0),0.5)
				
			"Tv":
				Global.dialogFinished = false
				_msg = msgShow[1]
				show_message(_msg)
				await get_tree().create_timer(10).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_6,"modulate",Color(1,1,1,0),0.5)
				
			"Posteritaipu":
				Global.dialogFinished = false
				_msg = msgShow[2]
				show_message(_msg)
				await get_tree().create_timer(10).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_6,"modulate",Color(1,1,1,0),0.5)
				
			"PosterBrehma":
				Global.dialogFinished = false
				_msg = msgShow[3]
				show_message(_msg)
				await get_tree().create_timer(10).timeout
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_6,"modulate",Color(1,1,1,0),0.5)
			
			"PosterAntipatica":
				Global.dialogFinished = false
				_msg = msgShow[4]
				show_message(_msg)
				await get_tree().create_timer(10).timeout
				
				var tween = get_tree().create_tween()
				tween.tween_property(ponto_luz_6,"modulate",Color(1,1,1,0),0.5)
				
				
func _on_texture_rect_mouse_entered():
	var material = get_parent().material
	if material is ShaderMaterial:
		# Define o valor de um parâmetro do shader
		material.set_shader_parameter("hovered", true)
		print("é um material")
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
