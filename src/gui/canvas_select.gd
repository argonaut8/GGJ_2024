class_name CanvasSelect
extends Control


signal canvas_selected(canvas_gradient: Image)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func canvas_picked(canvas_gradient: Image) -> void:
	canvas_selected.emit(canvas_gradient)
