extends PanelContainer


const tool_button: PackedScene = preload("res://src/gui/tool_button.tscn")

@onready var buttons_grid: GridContainer = $"%ButtonsGrid"

func _ready():
	SignalBus.set_available_tools.connect(set_tool_buttons)


func set_tool_buttons(tools: Array[Tool]) -> void:
	for tool in tools:
		if tool is Brush:
			var tool_button_instance = tool_button.instantiate()
			buttons_grid.add_child(tool_button_instance)
			tool_button_instance.set_icon(tool)
			tool_button_instance.pressed.connect(tool_button_pressed.bind(tool))

func tool_button_pressed(tool: Tool) -> void:
	SignalBus.tool_selected.emit(tool)
