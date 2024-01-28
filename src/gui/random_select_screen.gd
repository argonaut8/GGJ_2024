class_name RandomSelectScreen
extends Control

const tool_demo = preload("res://src/gui/tool_demo.tscn")
const swatch_grid: PackedScene = preload("res://src/gui/color_swatch.tscn")

const palettes = [	[Color("d5dc1d"), Color("3d6f43"), Color("1b2447"), Color("14121d")],
					[Color("86c69a"), Color("486859"), Color("485262"), Color("282c3c")],
					[Color("ceaaed"), Color("d480bb"), Color("4572e3"), Color("494182")],
					[Color("bda499"), Color("87738f"), Color("594d4d"), Color("33272a")],
					[Color("afe9df"), Color("8aa1f6"), Color("7f8e44"), Color("333c24")],
					[Color("e27285"), Color("b25266"), Color("f1641f"), Color("612721")],
					[Color("f8f644"), Color("f8c53a"), Color("b05b2c"), Color("673931")]]


@onready var tool_demo_show = $"%ToolDemoShow"
@onready var prompt_header: Label = $"%PromptHeader"
@onready var prompt_label: Label = $"%PromptLabel"
@onready var tool_header: Label = $"%ToolHeader"
@onready var palette_header: Label = $"%PaletteHeader"
@onready var color_swatch_show = $"%ColorSwatchShow"

var chosen_tools: Array[Tool] = []
var prompt: String = ""
var canvas: Image
var chosen_palettes_indices: Array = []

signal start_drawing(canvas: Image, prompt:String, tools: Array[Tool])

func _ready():
	prompt_header.hide()
	prompt_label.hide()
	tool_header.hide()
	tool_demo_show.hide()
	palette_header.hide()
	color_swatch_show.hide()

func pick_randoms(_canvas: Image) -> void:
	canvas = _canvas
	
	var tool_list = [
		Pen.new(canvas),
		Brush.new(canvas),
		Crayon.new(canvas),
		AirBrush.new(canvas),
		FingerPaint.new(canvas),
		Hairdryer.new(canvas),
		HotDogStamp.new(canvas),
		IceSkates.new(canvas),
		LineTool.new(canvas),
		Marker.new(canvas),
		SmudgeEraser.new(canvas)
	]
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	for i in range(6):
		var chosen_tool: Tool = tool_list.pop_at(rng.randi_range(0, tool_list.size()-1))
		chosen_tools.append(chosen_tool)
		var tool_demo_instance = tool_demo.instantiate()
		tool_demo_show.add_child(tool_demo_instance)
		tool_demo_instance.set_tool(chosen_tool)

	for tool in tool_list:
		tool.queue_free()
	
	prompt = RandomPrompts.new().pick_random_prompt()
	prompt_label.text = prompt
	
	var randomizer = RandomNumberGenerator.new()
	randomizer.randomize()
	# Create a shuffled list of random indices.
	var random_indices = range(0, palettes.size() - 1)
	for i in random_indices.size() - 1:
		var temp = random_indices[i]
		var swap_index = randomizer.randi_range(i, random_indices.size() - 1)
		random_indices[i] = random_indices[swap_index]
		random_indices[swap_index] = temp
	
	chosen_palettes_indices = random_indices
	for i in 3:
		var swatch = swatch_grid.instantiate() as ColorSwatch
		swatch.set_swatch(palettes[chosen_palettes_indices[i]])
		color_swatch_show.add_child(swatch)

func animate() -> void:
	prompt_header.show()
	prompt_label.show()
	tool_header.show()
	tool_demo_show.show()
	palette_header.show()
	color_swatch_show.show()


func _on_next_button_pressed():
	start_drawing.emit(canvas, prompt, chosen_tools, chosen_palettes_indices)
