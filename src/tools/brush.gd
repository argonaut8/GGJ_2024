class_name Brush
extends Tool

@export var brush_size: float = 5.0
@export var color: Color = Color.BLACK

var is_clicked: bool = false

func _init(canvas: Image) -> void:
	super._init(canvas)
	sprite.texture = load("res://assets/tools/button1.png")

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_clicked = true
				edited_pixels.append(event.position.round() as Vector2i)
				draw_pixels(edited_pixels)
			else:
				is_clicked = false
	elif event is InputEventMouseMotion and is_clicked:
		edited_pixels.append(event.position.round() as Vector2i)
		draw_pixels(edited_pixels)
		


func draw_pixels(pixels: Array[Vector2i]) -> void:
	var viewport_size = get_viewport_rect().size
	for pixel in pixels:
		if pixel.x >= 0 and pixel.x < viewport_size.x and pixel.y >= 0 and pixel.y < viewport_size.y:
			canvas_ref.set_pixelv(pixel, Color.BLACK)
			SignalBus.update_canvas.emit()
	edited_pixels.clear()
