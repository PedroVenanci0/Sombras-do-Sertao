extends CharacterBody2D
class_name Player

@onready var animationManager = $AnimationManager

var SPEED = 150
const JUMP_VELOCITY = -450
const MAX_JUMP_HOLD_TIME = 0.3  # Tempo máximo de segurar o botão para aumentar o pulo

var speedEscape: int = 0
var Destination = Vector2()
var distance = Vector2()
var Velocity = Vector2()
var SnapPosition = Vector2()
var onTitle = false
var isJump = false
var isDead = false
var moveOrder : bool = false;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 1050

var margin = 1

var jump_hold_time = 0.0

func _ready():
	Global.playerRef = self;
	Destination = position

func _physics_process(delta):
	
	#if Global.inEscape:
		#escapeBehaviour(delta);
	#else:
		#normalBehaviour(delta);
		
		
	if not is_on_floor() and Global.inEscape:
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("Click_Button") and is_on_floor() and Global.inEscape:
		velocity.y = JUMP_VELOCITY
		isJump = true
		jump_hold_time = 0.0
	
	if Input.is_action_pressed("Click_Button") and isJump and Global.inEscape:
		if jump_hold_time < MAX_JUMP_HOLD_TIME:
			jump_hold_time += delta
			velocity.y -= gravity * delta * 0.5

	# Handle the jump button release.
	if Input.is_action_just_released("Click_Button") and isJump:
		isJump = false
		
	if not Global.inEscape:
		distance = Vector2(Destination - position)
		if position != Destination:
			if moveOrder:
				print("Percorrendo distancia ", distance)
				velocity.x = distance.normalized().x * SPEED
				velocity.y = distance.normalized().x * 0
		if abs(distance.x) < 2:
			moveOrder = false
			
		if (Destination.x > position.x):
			get_node("Animations").flip_h = false
			get_node("LightOccluder2D").scale.x = 1
		if (Destination.x < position.x):
			get_node("Animations").flip_h = true
			get_node("LightOccluder2D").scale.x = -1
	elif Global.inEscape:
		velocity.x = speedEscape
		
	# Apply the calculated velocity.
	move_and_slide()
	
	if not isDead:
		if abs(velocity.x) <= 20 and not Global.inEscape:
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
		$CollisionShape2D.queue_free()
		set_physics_process(false)
		animationManager.active = true
		animationManager.play("death")
		
		
func _input(event):
	if Input.is_action_just_pressed("Click_Button") and not onTitle and Global.moviement_click:
		Destination = get_global_mouse_position()
		moveOrder = true;
		_play_click_animation(Destination)
	
	# DEBUG - Proteger jogador. TODO: Remover
	if Input.is_key_pressed(KEY_1):
		global_position.y = -784;

func _play_click_animation(position: Vector2):
	
	var click_animation = preload("res://scenes/click_animation.tscn").instantiate()
	
	click_animation.global_position = position
	get_parent().add_child(click_animation)
	

func _on_animation_manager_animation_finished(anim_name):
	animationManager.active = false
	
	if anim_name == "jump":
		isJump = false
