extends Node2D

var sprite
var special_animation_playing = false

func _ready():
	sprite = $AnimatedSprite2D
	sprite.animation_finished.connect(_on_animation_finished)

func _process(delta):
	# Cancel special animations with Escape (ui_cancel)
	if special_animation_playing and Input.is_action_just_pressed("ui_cancel"):
		special_animation_playing = false
		sprite.animation = "Idle"
		sprite.play()
		print("Animation cancelled!")
		return
	
	if special_animation_playing:
		return
	
	if Input.is_action_pressed("ui_right"):
		if sprite.animation != "Run" or sprite.flip_h == true:
			sprite.animation = "Run"
			sprite.flip_h = false
			sprite.play()
		position.x += 200 * delta
	elif Input.is_action_pressed("ui_left"):
		if sprite.animation != "Run" or sprite.flip_h == false:
			sprite.animation = "Run"
			sprite.flip_h = true
			sprite.play()
		position.x -= 200 * delta
	else:
		if sprite.animation != "Idle":
			sprite.animation = "Idle"
			sprite.play()
	
	# Special animations using only guaranteed inputs
	if Input.is_action_just_pressed("ui_accept"):   # Enter or Space
		play_special_animation("Meow")
	elif Input.is_action_just_pressed("ui_up"):     # Up arrow
		play_special_animation("Lick")
	elif Input.is_action_just_pressed("ui_down"):   # Down arrow
		play_special_animation("Stretch")
	elif Input.is_action_just_pressed("ui_home"):   # Home key (usually exists)
		play_special_animation("Lay")
	elif Input.is_action_just_pressed("ui_end"):    # End key (usually exists)
		play_special_animation("Sleeping1")
	# Add more keys if mapped, or use custom inputs

func play_special_animation(anim_name):
	special_animation_playing = true
	sprite.animation = anim_name
	sprite.play()
	print("Playing animation: ", anim_name)

func _on_animation_finished():
	print("Animation finished signal received")
	if special_animation_playing:
		special_animation_playing = false
		print("Special animation ended, returning to idle")
		# Let _process handle setting Idle on next frame
