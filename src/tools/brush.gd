class_name Brush
extends Tool

@export var brush_size: float = 5.0
@export var color: Color = Color.BLACK

var is_clicked: bool = false

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_clicked = true
				edited_pixels.append(event.position.round() as Vector2i)
				SignalBus.draw_pixels.emit(edited_pixels)
				edited_pixels.clear()
				print("CLICK")
			else:
				is_clicked = false
				print(edited_pixels)
				#
	elif event is InputEventMouseMotion and is_clicked:
		edited_pixels.append(event.position.round() as Vector2i)
		SignalBus.draw_pixels.emit(edited_pixels)
		edited_pixels.clear()
