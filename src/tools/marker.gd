class_name Marker
extends Tool

@export var brush_size: float = 5.0

var is_clicked: bool = false
var prev_mouse_position: Vector2

func _init(canvas: Image) -> void:
	super._init(canvas)
	sprite.texture = load("res://assets/tools/button3.png")

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_clicked = true
				edited_pixels[event.position.round() as Vector2i] = color
				prev_mouse_position = event.position
				draw_pixels(edited_pixels)
			else:
				is_clicked = false
	elif event is InputEventMouseMotion and is_clicked:
		var brushPosition = prev_mouse_position
		while (brushPosition - event.position).length() > 0.0:
			for x in range(brushPosition.round().x - 3, brushPosition.round().x + 3):
				for y in range(brushPosition.round().y - 5, brushPosition.round().y + 5):
					edited_pixels[Vector2i(x, y)] = color
			brushPosition = brushPosition.move_toward(event.position, 1)
		draw_pixels(edited_pixels)
		prev_mouse_position = event.position



