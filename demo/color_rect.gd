extends ColorRect

# Define start and end colors
var color_a: Color = Color(1, 0.717, 0.772) # pink-ish
var color_b: Color = Color(1, 0.839, 0.647) # peach-ish

var speed: float = 2.0 # seconds for full cycle
var t: float = 0.0

func _process(delta: float) -> void:
	t += delta / speed
	var factor = abs(sin(t * PI)) # ping-pong effect
	color = color_a.lerp(color_b, factor)
