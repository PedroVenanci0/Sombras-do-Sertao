extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var firstCutscene = false
@onready var animation = $AnimatedSprite2D
var direction = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980


func _process(delta):
	if firstCutscene:
		play_cutscene()
	move_and_slide()

func play_cutscene():
	firstCutscene = false # Garante que a cutscene só será executada uma vez
	
	await get_tree().create_timer(1).timeout
	global_position = Vector2(615, -165)
	animation.flip_h = false
	animation.play("Spawn")
	await animation.animation_finished
	animation.play("idle")
	await get_tree().create_timer(1).timeout
	animation.play("Disappearing")
	await get_tree().create_timer(0.5).timeout
	global_position = Vector2(246, -169)
	animation.flip_h = true
	animation.play("Spawn")
	await animation.animation_finished
	animation.play("idle")
	await get_tree().create_timer(1.8).timeout
	animation.play("walk")
	velocity.x = direction * SPEED
