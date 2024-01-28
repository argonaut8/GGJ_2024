class_name ToolDemo
extends PanelContainer

@onready var icon_panel = $"%IconPanel"
@onready var name_label = $"%NameLabel"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_tool(tool: Tool) -> void:
	icon_panel.texture = tool.sprite.texture
	name_label.text = tool.tool_name
