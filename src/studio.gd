class_name Studio
extends Node2D

enum TOOLS {PENCIL}

@onready var backgroundSprite: Sprite2D = $"%Background"
@onready var canvasSprite: Sprite2D = $"%Canvas"

var canvas: Image
var canvasTexture: ImageTexture
var current_tool: Tool

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create the gradient for the background
	SignalBus.update_canvas.connect(update_canvas)
	#current_tool = Brush.new()
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
	var tools: Array[Tool] = []
	tools.append(Brush.new(canvas))
	tools.append(Stamp.new(canvas))
	tools.append(Pen.new(canvas))
	tools.append(Marker.new(canvas))
	tools.append(Hairdryer.new(canvas))
	tools.append(SmudgeEraser.new(canvas))
	SignalBus.set_available_tools.emit(tools)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_canvas() -> void:
	canvasTexture.update(canvas)
