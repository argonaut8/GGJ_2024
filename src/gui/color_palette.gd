extends PanelContainer

const swatch_grid: PackedScene = preload("res://src/gui/color_swatch.tscn")

const palettes = [	[Color("d5dc1d"), Color("3d6f43"), Color("1b2447"), Color("14121d")],
					[Color("86c69a"), Color("486859"), Color("485262"), Color("282c3c")],
					[Color("ceaaed"), Color("d480bb"), Color("4572e3"), Color("494182")]]
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 3:
		var swatch = swatch_grid.instantiate() as ColorSwatch
		swatch.set_swatch(palettes[i])
		$VBoxContainer.add_child(swatch)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func color_button_pressed(color: Color) -> void:
	pass
