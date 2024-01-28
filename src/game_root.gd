class_name GameRoot
extends Control

@onready var studio: Studio = $"%Studio"
@onready var prompt_header: Prompt = $"%Prompt"
@onready var color_palettes: ColorPalette = $"%ColorPalette"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_gradient(canvas_gradient: Image) -> void:
	studio.set_gradient(canvas_gradient)

func set_tools(tools: Array[Tool]) -> void:
	studio.set_tools(tools)

func set_prompt(prompt: String) -> void:
	prompt_header.set_prompt(prompt)

func set_colors(chosen_palettes_indices) -> void:
	color_palettes.set_palettes(chosen_palettes_indices)
