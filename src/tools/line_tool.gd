class_name LineTool
extends Tool

var is_clicked: bool = false
var anchor: Vector2
var brush_position: Vector2

func _init(canvas: Image) -> void:
	super._init(canvas)
	sprite.texture = load("res://assets/tools/button6.png")
	tool_name = "Line Tool"
	tool_description = "Draw perfectly straight lines!"

func _draw() -> void:
	if is_clicked:
		draw_line(to_local(anchor), to_local(brush_position),  color, 1)

func _process(delta):
	queue_redraw()

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_clicked = true
				anchor = event.position
			else:
				is_clicked = false
				var brushPosition = anchor
				print(brushPosition - event.position)
				while (brushPosition - event.position).length() > 0.0:
					edited_pixels[brushPosition.round() as Vector2i] = color
					brushPosition = brushPosition.move_toward(event.position, 1)
				draw_pixels(edited_pixels)
				brush_position = event.position
	elif event is InputEventMouseMotion:
		brush_position = event.position
