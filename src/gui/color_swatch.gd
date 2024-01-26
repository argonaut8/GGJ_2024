class_name ColorSwatch
extends GridContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_swatch(color_array) -> void:
	$ColorRect.color = color_array[0]
	$ColorRect.gui_input.connect(color_selected.bind(color_array[0]))
	$ColorRect2.color = color_array[1]
	$ColorRect2.gui_input.connect(color_selected.bind(color_array[1]))
	$ColorRect3.color = color_array[2]
	$ColorRect3.gui_input.connect(color_selected.bind(color_array[2]))
	$ColorRect4.color = color_array[3]
	$ColorRect4.gui_input.connect(color_selected.bind(color_array[3]))

func color_selected(event: InputEvent, color: Color):
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			SignalBus.color_selected.emit(color)
