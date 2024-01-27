class_name Crayon
extends Tool

var is_clicked: bool = false
var prev_mouse_position: Vector2

func _init(canvas: Image) -> void:
	super._init(canvas)
	tool_size = 5
	sprite.texture = load("res://assets/tools/button2.png")
	tool_name = "Crayon"

#func _process(_delta: float) -> void:
	#if is_clicked:
		#air_brush(get_local_mouse_position(), tool_size)

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_clicked = true
				prev_mouse_position = event.position.round()
				
				crayon_brush(prev_mouse_position, tool_size)
				draw_pixels(edited_pixels)
			else:
				is_clicked = false
	elif event is InputEventMouseMotion and is_clicked:
		var brushPosition = prev_mouse_position
		while (brushPosition - event.position).length() > 0.0:
			crayon_brush(brushPosition.round(), tool_size)
			brushPosition = brushPosition.move_toward(event.position, 1)
		draw_pixels(edited_pixels)
		prev_mouse_position = event.position


func crayon_brush(center: Vector2i, brush_size:int) -> void:
	var viewport_size = get_viewport_rect().size
	var x:int = center.x
	var y:int = center.y
	if x < 0 or x >= viewport_size.x or y < 0 or y >= viewport_size.y: return
	var r = brush_size
	var center_pixel_color = canvas_ref.get_pixel(x,y)
	for i in range(-r, r):
		for j in range(-r, r):
			if(i*i + j*j <= r*r):
			#if(i*i + j*j <= r*r):
				var spray_chance = rng.randf()*10
				var center_dist = 1 - j*j/float(r*r) - i*i/float(r*r)
				if spray_chance <= center_dist:
					edited_pixels[Vector2i(x+i, y+j)] = color
