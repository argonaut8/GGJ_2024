class_name ColorPalette
extends PanelContainer

const swatch_grid: PackedScene = preload("res://src/gui/color_swatch.tscn")

const palettes = [	[Color("d5dc1d"), Color("3d6f43"), Color("1b2447"), Color("14121d")],
					[Color("86c69a"), Color("486859"), Color("485262"), Color("282c3c")],
					[Color("ceaaed"), Color("d480bb"), Color("4572e3"), Color("494182")],
					[Color("bda499"), Color("87738f"), Color("594d4d"), Color("33272a")],
					[Color("afe9df"), Color("8aa1f6"), Color("7f8e44"), Color("333c24")],
					[Color("e27285"), Color("b25266"), Color("f1641f"), Color("612721")],
					[Color("f8f644"), Color("f8c53a"), Color("b05b2c"), Color("673931")]]
# Called when the node enters the scene tree for the first time.
#func _ready():
	#var randomizer = RandomNumberGenerator.new()
	#randomizer.randomize()
	## Create a shuffled list of random indices.
	#var random_indices = range(0, palettes.size() - 1)
	#for i in random_indices.size() - 1:
		#var temp = random_indices[i]
		#var swap_index = randomizer.randi_range(i, random_indices.size() - 1)
		#random_indices[i] = random_indices[swap_index]
		#random_indices[swap_index] = temp
		#
	#for i in 3:
		#var swatch = swatch_grid.instantiate() as ColorSwatch
		#swatch.set_swatch(palettes[random_indices[i]])
		#$VBoxContainer.add_child(swatch)

func set_palettes(chosen_palettes_indices) -> void:
	for i in 3:
		var swatch = swatch_grid.instantiate() as ColorSwatch
		swatch.set_swatch(palettes[chosen_palettes_indices[i]])
		$VBoxContainer.add_child(swatch)
