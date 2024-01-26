extends Node

var canvas: Image
var canvasTexture: ImageTexture
@export var backgroundSprite: Sprite2D
@export var canvasSprite: Sprite2D

var current_tool: Tool

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create the gradient for the background
	SignalBus.draw_pixels.connect(draw_pixels)
	current_tool = Brush.new()
	add_child(current_tool)
	var bgGradient: Gradient = Gradient.new()
	var viewport_size = get_viewport().size
	bgGradient.add_point(0, Color(1, 1, 1, 1))
	bgGradient.add_point(viewport_size.y, Color(0.3, 0.8, 1, 1))
	# Create the background image, using the gradient
	var bgImage: Image = Image.create(viewport_size.x, viewport_size.y, false, Image.FORMAT_RGBA8)
	for y in viewport_size.y:
		for x in viewport_size.x:
			bgImage.set_pixel(x, y, bgGradient.sample(float(y)))
	
	var bgTexture: ImageTexture = ImageTexture.create_from_image(bgImage)
	backgroundSprite.texture = bgTexture
	
	canvas = Image.create(viewport_size.x, viewport_size.y, false, Image.FORMAT_RGBA8)
	canvasTexture = ImageTexture.create_from_image(canvas)
	canvasSprite.texture = canvasTexture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func draw_pixels(pixels: Array[Vector2i]) -> void:
	for pixel in pixels:
		canvas.set_pixelv(pixel, Color.BLACK)
		canvasTexture.update(canvas)
