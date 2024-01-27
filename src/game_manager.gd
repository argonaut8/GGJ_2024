class_name GameManager
extends Node

const main_menu_scene: PackedScene = preload("res://src/gui/main_menu.tscn")
const studio_scene: PackedScene = preload("res://src/studio.tscn")

var current_child: Node

func _ready():
	load_main_menu()

func switch_to_scene(scene: PackedScene) -> Node:
	if current_child != null:
		current_child.queue_free()
	current_child = scene.instantiate()
	add_child(current_child)
	return current_child

func load_main_menu() -> void:
	var main_menu: MainMenu = switch_to_scene(main_menu_scene)
	main_menu.new_drawing.connect(_on_new_drawing_requested)

func _on_new_drawing_requested() -> void:
	var game: GameRoot = switch_to_scene(studio_scene)
	#game.main_menu_requested.connect(load_main_menu)
	#game.new_game()
