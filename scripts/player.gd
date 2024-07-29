extends CharacterBody2D
class_name Player

@onready var animationManager = $AnimationManager

var SPEED = 150
const JUMP_VELOCITY = -600

var Destination = Vector2()
var distance = Vector2()
var Velocity = Vector2()
var SnapPosition = Vector2()
var onTitle = false
var isJump = false
var isDead = false

 ## Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var margin = 1

func _ready():
	Destination = position

func _physics_process(delta):
	  ## Add the gravity.
	if not is_on_floor() and Global.inEscape:
		velocity.y += gravity * delta
		

	# Handle jump.
	if Input.is_action_pressed("Click_Button") and is_on_floor() and Global.inEscape:
		velocity.y = JUMP_VELOCITY
		isJump = true
		
		
	if not Global.inEscape:
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
	else:
		velocity.x = 10
		move_and_slide()
		
	if not isDead:
		if abs(velocity.x) <= 20 and !Global.isRun:
			animationManager.play("idle")
		else:
			animationManager.active = true
			
			if Global.isRun and not isJump:
				animationManager.play("run")
			elif not Global.isRun and not isJump:
				animationManager.play("walk")
			else:
				animationManager.play("jump")
	else:
		set_physics_process(false)
		animationManager.active = true
		animationManager.play("death")
		
func _input(event):
	if Input.is_action_just_pressed("Click_Button") and not onTitle and Global.moviement_click:
		Destination = get_global_mouse_position()

func _on_animation_manager_animation_finished(anim_name):
	animationManager.active = false
	
	if anim_name == "jump":
		isJump = false
