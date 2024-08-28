extends Node2D

@onready var sun = $Sun
@onready var moon = $Moon
@onready var screenSize : Vector2i = get_viewport().size
var hours : int
var minutes : int 
var seconds : int

@export_category("Horario Debug")
@export_range(0, 23) var setHours: int = 12
@export_range(0, 60) var setMinutes: int = 0
@export_range(0, 60) var setSeconds: int = 0
@export var debugHour : bool = false

func _ready():
	updateSunMoonPosition()

func _process(delta):
	updateSunMoonPosition()

func updateSunMoonPosition():
	if debugHour:
		hours = setHours
		minutes = setMinutes
		seconds = setSeconds
	else:
		var _time = Time.get_time_dict_from_system()
		hours = _time.get("hour")
		minutes = _time.get("minute")
		seconds = _time.get("second")

	# Converte o tempo em minutos desde o início do dia
	var timeInMinutes = hours * 60 + minutes + seconds / 60.0
	var totalDayminutes = 24 * 60

	# Normaliza o tempo para o intervalo [0, 1]
	var normalizedTime = timeInMinutes / totalDayminutes

	# Calcula o ângulo atual em radianos
	var angle = normalizedTime * TAU  # TAU é 2 * PI, que representa um círculo completo

	# Define o raio do círculo (metade da largura da tela, por exemplo)
	var radius = min(screenSize.x, screenSize.y) * 0.75  # Ajuste o raio conforme necessário

	# Calcula as posições do sol e da lua
	var center = Vector2(screenSize.x / 2, screenSize.y / 2)
	
	# Sol começa do lado esquerdo e se põe no lado direito
	var sunPositionX = center.x + radius * cos(angle - PI / 2)
	var sunPositionY = center.y + 200 - radius * sin(angle - PI / 2)  # Ajusta para que o sol comece do lado esquerdo
	
	# Lua oposta ao sol (em relação ao ângulo)
	var moonPositionX = center.x + radius * cos(angle + PI / 2)  # Adiciona PI / 2 para ficar oposto
	var moonPositionY = center.y + 200 - radius * sin(angle + PI / 2)  # Adiciona PI / 2 para ficar oposto

	sun.position = Vector2(sunPositionX, sunPositionY)
	moon.position = Vector2(moonPositionX, moonPositionY)
