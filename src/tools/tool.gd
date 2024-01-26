class_name Tool
extends Node2D

var icon: Texture2D
var sprite: Sprite2D
var canvas_ref: Image
var edited_pixels: Array[Vector2i] = []

func _init(canvas: Image) -> void:
	canvas_ref = canvas
	sprite = Sprite2D.new()
	add_child(sprite)
	sprite.centered = false
	sprite.offset = Vector2(-32, -32)
	


func draw_pixels(pixels: Array[Vector2i]) -> void:
	var viewport_size = get_viewport_rect().size
	for pixel in pixels:
		if pixel.x >= 0 and pixel.x < viewport_size.x and pixel.y >= 0 and pixel.y < viewport_size.y:
			canvas_ref.set_pixelv(pixel, Color.BLACK)
			SignalBus.update_canvas.emit()
	edited_pixels.clear()
