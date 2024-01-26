class_name Brush
extends Tool

var is_clicked: bool = false
var prev_mouse_position: Vector2

func _init(canvas: Image) -> void:
	super._init(canvas)
	tool_size = 5
	sprite.texture = load("res://assets/tools/button3.png")

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_clicked = true
				prev_mouse_position = event.position.round()
				
				_draw_filled_circle(prev_mouse_position.x, prev_mouse_position.y, tool_size)
				draw_pixels(edited_pixels)
			else:
				is_clicked = false
	elif event is InputEventMouseMotion and is_clicked:
		var brushPosition = prev_mouse_position
		while (brushPosition - event.position).length() > 0.0:
			_draw_filled_circle(brushPosition.round().x, brushPosition.round().y, tool_size)
			brushPosition = brushPosition.move_toward(event.position, 1)
		draw_pixels(edited_pixels)
		prev_mouse_position = event.position

func _draw_filled_circle(x:int, y:int, r:int) -> void:
	for i in range(-r, r):
		for j in range(-r, r):
			if(i*i + j*j <= r*r):
				var new_color = color
				new_color.a = 1 - j*j/float(r*r) - i*i/float(r*r)
				if Vector2i(x+i, y+j) in edited_pixels.keys():
					edited_pixels[Vector2i(x+i, y+j)].a += new_color.a
				else:
					edited_pixels[Vector2i(x+i, y+j)] = new_color
