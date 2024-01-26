class_name Tool
extends Node2D

var icon: Texture2D
var sprite: Sprite2D
var canvas_ref: Image
#var edited_pixels: Array[Vector2i] = []
var edited_pixels: Dictionary = {}
var color: Color = Color.BLACK

func _init(canvas: Image) -> void:
	canvas_ref = canvas
	sprite = Sprite2D.new()
	add_child(sprite)
	sprite.centered = false
	sprite.offset = Vector2(-32, -32)
	


#func draw_pixels(pixels: Array[Vector2i]) -> void:
func draw_pixels(pixels: Dictionary) -> void:
	var viewport_size = get_viewport_rect().size
	for pixel_coord in pixels.keys():
		var pixel_color = pixels[pixel_coord]
		if pixel_coord.x >= 0 and pixel_coord.x < viewport_size.x and pixel_coord.y >= 0 and pixel_coord.y < viewport_size.y:
			canvas_ref.set_pixelv(pixel_coord, pixel_color)
			SignalBus.update_canvas.emit()
	edited_pixels.clear()
