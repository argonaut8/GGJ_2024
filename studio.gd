extends Node

var canvas: Image
var canvasTexture: ImageTexture
@export var backgroundSprite: Sprite2D
@export var canvasSprite: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create the gradient for the background
	var bgGradient: Gradient = Gradient.new()
	bgGradient.add_point(0, Color(1, 1, 1, 1))
	bgGradient.add_point(300, Color(0.3, 0.8, 1, 1))
	# Create the background image, using the gradient
	var bgImage: Image = Image.create(250, 300, false, Image.FORMAT_RGBA8)
	for y in 300:
		for x in 250:
			bgImage.set_pixel(x, y, bgGradient.sample(float(y)))
	
	var bgTexture: ImageTexture = ImageTexture.create_from_image(bgImage)
	backgroundSprite.texture = bgTexture
	
	canvas = Image.create(250, 300, false, Image.FORMAT_RGBA8)
	canvasTexture = ImageTexture.create_from_image(canvas)
	canvasSprite.texture = canvasTexture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
