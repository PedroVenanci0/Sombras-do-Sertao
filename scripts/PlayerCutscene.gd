extends CharacterBody2D

var firstCutscene = false
var Speed = 200
var direction : Vector2 = Vector2.ZERO
var is_moving
var escape = true
@onready var animation = $AnimationManager
var gravity = 980

func _process(delta):
	velocity.y += gravity * delta
	if firstCutscene:
		direction.x = 1
		velocity.x = Speed * direction.x
		is_moving = true
		await get_tree().create_timer(1).timeout
		is_moving = false
		velocity.x = 0
		firstCutscene = false
		animation.play("idle")
		Global.cameraShake = true
		
		await get_tree().create_timer(1).timeout
		direction.x = -1
		Global.cameraShake = false
		velocity.x = direction.x * Speed
		is_moving = true
		
		await get_tree().create_timer(0.5).timeout
		is_moving = false
		velocity.x = 0
		animation.play("idle")
		Global.cameraShake = true
		
		await  get_tree().create_timer(1).timeout
		get_parent().moveCamera = true
		direction.x = 1
		Global.cameraShake = false
		is_moving = true
		Speed = 300
		velocity.x = direction.x * Speed
		await get_tree().create_timer(2).timeout
		get_parent().changeScene = true

func _physics_process(delta):
	if is_moving:
		move_and_slide()
		animationManager() # Chama o gerenciador de animação enquanto o player está se movendo

func animationManager():
	if abs(direction.x) > 0.1:
		animation.play("run")
		if direction.x  > 0:
			get_node("Animations").flip_h = false  # Não espelha se estiver indo para a direita
		else:
			get_node("Animations").flip_h = true   # Espelha se estiver indo para a esquerda
	else:
		animation.play("idle")
