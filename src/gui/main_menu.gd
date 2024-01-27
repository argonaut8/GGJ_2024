class_name MainMenu
extends Control

signal new_drawing()

func _ready():
	pass # Replace with function body.


func _on_new_drawing_button_pressed():
	new_drawing.emit()


func _on_quit_button_pressed():
	get_tree().quit()
