class_name Stamp
extends Tool

func _init(canvas: Image) -> void:
	super._init(canvas)
	sprite.texture = load("res://assets/tools/button9.png")

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var image = sprite.texture.get_image()
				image.resize(image.get_width()*tool_size, image.get_height()*tool_size, 0)
				
				for x in image.get_width():
					for y in image.get_height():
						var image_pixel = image.get_pixel(x,y)
						if image_pixel.a == 1:
							var pos: Vector2i = event.position + Vector2(x,y) - Vector2(image.get_width()/2, image.get_height()/2)
							edited_pixels[pos] = image_pixel
				draw_pixels(edited_pixels)
