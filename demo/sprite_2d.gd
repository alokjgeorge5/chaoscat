extends Sprite2D

# Speed in pixels per second
var speed: float = 200.0

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - global_position).normalized()
	
	# Move towards the cursor smoothly
	global_position += direction * speed * delta
