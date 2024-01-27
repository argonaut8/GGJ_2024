class_name CanvasSelection
extends PanelContainer

@onready var canvas_texture: TextureRect = $"%CanvasTexture"

signal canvas_picked(gradient: Image)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pick_button_pressed():
	var gradient_texture: Image = canvas_texture.texture.get_image()
	canvas_picked.emit(gradient_texture)
