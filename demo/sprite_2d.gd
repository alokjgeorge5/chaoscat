extends Sprite2D

var speed = 100
var direction = Vector2.ZERO
var change_time = 0.5
var time_passed = 0.0

func _process(delta):
	time_passed += delta
	if time_passed > change_time:
		direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		time_passed = 0
	position += direction * speed * delta
