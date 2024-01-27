class_name MainMenu
extends Control

signal new_drawing()

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	$BackgroundSpikes.region_rect.position.y -= delta * 8
	$BackgroundConfetti1.region_rect.position.y -= delta * 6
	$BackgroundConfetti2.region_rect.position.y -= delta * 3

func _on_new_drawing_button_pressed():
	new_drawing.emit()

func _on_credits_button_pressed():
	$CreditsDialog.show()
