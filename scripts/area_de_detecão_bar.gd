extends Node2D

@onready var label = $"../Player/PlayerLabel"
@onready var timer = $Timer
@onready var player = $"../Player"


var _msg: String = ""

var msgShow: Array = [
	
	"Sinuca",
	"",
	"",
	"",
	"",
	"",
	"",
	""
	
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Click_Button") and Global.dialogFinished:
		match get_parent().name:
			"Sinuca": 
				_msg = msgShow[0]
				show_message(_msg)
				
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
	else:
		label.visible_characters += 1	


func _on_texture_rect_mouse_exited():
	set_process(false)
	Global.moviement_click = true

func _on_texture_rect_mouse_entered():
	Global.moviement_click = false
	set_process(true)
