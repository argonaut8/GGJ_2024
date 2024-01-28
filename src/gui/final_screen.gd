class_name FinalScreen
extends Control

@onready var studio: Studio = $"%Studio"
@onready var prompt_label: Label = $"%PromptLabel"

signal restart_draw
signal main_menu_requested

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_gradient(canvas_gradient: Image) -> void:
	studio.set_gradient(canvas_gradient)

func set_prompt(prompt: String) -> void:
	prompt_label.text = prompt

func _on_save_button_pressed():
	# For some reason we need to wait two frames for the viewport.
	await get_tree().idle_frame
	await get_tree().idle_frame
	var rectangle = Rect2(0, 0, 250, 300)
	var img = %SubViewport.get_texture().get_data() as Image
	img.flip_y()
	var buffer = img.save_png_to_buffer
	JavaScriptBridge.download_buffer(buffer, "render.png")

func _on_restart_button_pressed():
	restart_draw.emit()

func _on_main_menu_button_pressed():
	main_menu_requested.emit()
