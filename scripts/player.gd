extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var label = $Label
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var timer = $Timer

func _ready():
	DataManager.score_value_changed.connect(_on_score_changed)
	fade_out_score(0.1)

func _on_score_changed(value):
	label.text = str(value)
	fade_in_score(0.5)
	timer.start()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func fade_in_score(duration=1.0):
	var tween = create_tween()
	tween.tween_property(label, "modulate:a", 1.0, duration) # Fade in over 1 second
	tween.play()

func fade_out_score(duration=1.0):
	var tween = create_tween()
	tween.tween_property(label, "modulate:a", 0.0, duration) # Fade out over 1 second
	tween.play()


func _on_timer_timeout():
	fade_out_score(0.5)
