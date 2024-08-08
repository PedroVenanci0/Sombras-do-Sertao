extends Node2D

@onready var house = $House
@onready var house_2 = $House2
@onready var screen_size : Vector2i = get_viewport().size
var hours : int
var minutes : int 
var seconds : int

@export_category("Horario Exportavel")
@export_range(0, 23) var set_hours: int = 12
@export_range(0, 60) var set_minutes: int = 0
@export_range(0, 60) var set_seconds: int = 0
@export var debugHour : bool = false

func _ready():
	_update_sun_and_moon_position()

func _process(delta):
	_update_sun_and_moon_position()

func _update_sun_and_moon_position():
	if debugHour:
		hours = set_hours
		minutes = set_minutes
		seconds = set_seconds
	else:
		var _time = Time.get_time_dict_from_system()
		hours = _time.get("hour")
		minutes = _time.get("minute")
		seconds = _time.get("second")

	# Converte o tempo em minutos desde o início do dia
	var time_in_minutes = hours * 60 + minutes + seconds / 60.0
	var total_day_minutes = 24 * 60

	# Normaliza o tempo para o intervalo [0, 1]
	var normalized_time = time_in_minutes / total_day_minutes

	# Calcula o ângulo atual em radianos
	var angle = normalized_time * TAU  # TAU é 2 * PI, que representa um círculo completo

	# Define o raio do círculo (metade da largura da tela, por exemplo)
	var radius = min(screen_size.x, screen_size.y) * 0.75  # Ajuste o raio conforme necessário

	# Calcula as posições do sol e da lua
	var center = Vector2(screen_size.x / 2, screen_size.y / 2)
	
	# Sol começa do lado esquerdo e se põe no lado direito
	var sun_x_position = center.x + radius * cos(angle - PI / 2)
	var sun_y_position = center.y + 200 - radius * sin(angle - PI / 2)  # Ajusta para que o sol comece do lado esquerdo
	
	# Lua oposta ao sol (em relação ao ângulo)
	var moon_x_position = center.x + radius * cos(angle + PI / 2)  # Adiciona PI / 2 para ficar oposto
	var moon_y_position = center.y + 200 - radius * sin(angle + PI / 2)  # Adiciona PI / 2 para ficar oposto

	house.position = Vector2(sun_x_position, sun_y_position)
	house_2.position = Vector2(moon_x_position, moon_y_position)
