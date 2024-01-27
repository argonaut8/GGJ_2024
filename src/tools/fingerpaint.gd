class_name FingerPaint
extends Tool

var is_clicked: bool = false
var prev_mouse_position: Vector2
var prog_color:Color

func _init(canvas: Image) -> void:
	super._init(canvas)
	sprite.texture = load("res://assets/tools/button5.png")
	tool_size = 5
	prog_color = color
	#tool_name = "Fingerpaint"
	#tool_description = "Paint with your fingers!!"

func _ready() -> void:
	SignalBus.color_selected.connect(set_prog_color)

func set_prog_color(color: Color) -> void:
	prog_color = color

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_clicked = true
				prev_mouse_position = event.position.round()
				_draw_fingerprint(event.position.x, event.position.y, tool_size, prog_color)
			else:
				is_clicked = false
				prog_color = color
	elif event is InputEventMouseMotion and is_clicked:
		var brushPosition = prev_mouse_position
		while (brushPosition - event.position).length() > 0.0:
			_draw_fingerprint(brushPosition.round().x, brushPosition.round().y, tool_size, prog_color)
			prog_color.a = lerpf(prog_color.a, 0, 0.05)
			brushPosition = brushPosition.move_toward(event.position, 1)
		draw_pixels(edited_pixels)
		prev_mouse_position = event.position
				


func _draw_fingerprint(x:int, y:int, r:int, color: Color) -> void:
	for i in range(-r, r):
		for j in range(-r, r):
			if(i*i + j*j <= r*r):
				var new_color = color
				if Vector2i(x+i, y+j) in edited_pixels.keys():
					edited_pixels[Vector2i(x+i, y+j)].a = clamp(new_color.a + edited_pixels[Vector2i(x+i, y+j)].a, 0, 1)
				else:
					edited_pixels[Vector2i(x+i, y+j)] = new_color
