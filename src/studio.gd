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
	SignalBus.update_canvas.connect(update_canvas)
	var viewport_size = get_viewport().size
	canvas = Image.create(viewport_size.x, viewport_size.y, false, Image.FORMAT_RGBA8)

func update_canvas() -> void:
	canvasTexture.update(canvas)

func set_gradient(canvas_gradient: Image) -> void:
	var viewport_size = get_viewport().size
	canvas_gradient.resize(viewport_size.x, viewport_size.y)
	for y in viewport_size.y:
		for x in viewport_size.x:
			canvas.set_pixel(x, y, canvas_gradient.get_pixel(x,y))
	canvasTexture = ImageTexture.create_from_image(canvas)
	canvasSprite.texture = canvasTexture

func set_tools(tools: Array[Tool]) -> void:
	for tool in tools:
		tool.canvas_ref = canvas
	SignalBus.set_available_tools.emit(tools)
