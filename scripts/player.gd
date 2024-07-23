extends CharacterBody2D

class_name Player

@onready var light_occluder_2d = $Animations/LightOccluder2D

var SPEED = 300
const JUMP_VELOCITY = -400.0

var Destination = Vector2()
var distance = Vector2()
var Velocity = Vector2()
var SnapPosition = Vector2()

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var margin = 1

func _ready():
	
	Destination = position

func _physics_process(delta):
	
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if position != Destination:
		distance = Vector2(Destination - position)
		velocity.x = distance.normalized().x * SPEED
		velocity.y = distance.normalized().x * 0
	
		move_and_slide()
		
	if (Destination.x > position.x):
		get_node("Animations").flip_h = false
		get_node("LightOccluder2D").scale.x = 1
	if (Destination.x < position.x):
		get_node("Animations").flip_h = true
		get_node("LightOccluder2D").scale.x = -1
		
	#print(get_global_mouse_position())
	
func _input(event):
	if Input.is_action_just_pressed("Click_Button"):
		Destination = get_global_mouse_position()
