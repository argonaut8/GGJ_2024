class_name Stamp
extends Tool

var stamp_scale: float = 1

func _init(canvas: Image) -> void:
	super._init(canvas)
	sprite.texture = load("res://assets/tools/button9.png")

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var image_size = sprite.texture.get_size()
				for x in image_size.x:
					for y in image_size.y:
						var image_pixel = sprite.texture.get_image().get_pixel(x,y)
						if image_pixel == Color.BLACK:
							var pos: Vector2i = event.position - Vector2i(x,y)/stamp_scale
							edited_pixels.append(pos)
				draw_pixels(edited_pixels)
