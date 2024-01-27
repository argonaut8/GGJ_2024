extends Node

func _process(delta):
	$BackgroundSpikes.region_rect.position.y -= delta * 8
	$BackgroundConfetti1.region_rect.position.y -= delta * 6
	$BackgroundConfetti2.region_rect.position.y -= delta * 3
