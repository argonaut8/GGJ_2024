class_name Hairdryer
extends Tool

@export var brush_size: float = 5.0

var is_clicked: bool = false
var prev_mouse_position: Vector2

func _init(canvas: Image) -> void:
	super._init(canvas)
	sprite.texture = load("res://assets/tools/button14.png")

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_clicked = true
				prev_mouse_position = event.position
				draw_pixels(edited_pixels)
			else:
				is_clicked = false
	elif event is InputEventMouseMotion and is_clicked:
		var brushPosition = prev_mouse_position
		var smearDirection: Vector2 = (event.position - brushPosition).normalized() * 20
		for i in 50:
			var theta : float = randf() * 2 * PI
			var startPosition = (brushPosition + Vector2(cos(theta), sin(theta)) * sqrt(randf()) * 20).round()
			startPosition.x = clamp(startPosition.x, 0, canvas_ref.get_width() - 1)
			startPosition.y = clamp(startPosition.y, 0, canvas_ref.get_height() - 1)
			var midPosition = startPosition
			var endPosition = startPosition + smearDirection
			if canvas_ref.get_pixelv(startPosition).a == 0: continue
			while (midPosition - endPosition).length() > 0.0:
				edited_pixels[midPosition as Vector2i] = canvas_ref.get_pixelv(startPosition)
				midPosition = midPosition.move_toward(endPosition, 1)
			
		draw_pixels(edited_pixels)
		prev_mouse_position = event.position



