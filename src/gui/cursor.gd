class_name Cursor
extends Marker2D

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.tool_selected.connect(set_tool)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position().round()


func set_tool(tool: Tool) -> void:
	for child in get_children():
		if child is Tool:
			remove_child(child)
	
	add_child(tool)
	
