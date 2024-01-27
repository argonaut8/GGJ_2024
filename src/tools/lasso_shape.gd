class_name LassoShape
extends Tool

var is_clicked: bool = false
var start_mouse_position: Vector2
var prev_mouse_position: Vector2

func _init(canvas: Image) -> void:
	super._init(canvas)
	sprite.texture = load("res://assets/tools/button8.png")

func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_clicked = true
				start_mouse_position = event.position
				prev_mouse_position = event.position
				
				edited_pixels[event.position.round() as Vector2i] = color
				draw_pixels(edited_pixels)
			else:
				is_clicked = false
	elif event is InputEventMouseMotion and is_clicked:
		var brushPosition = prev_mouse_position
		while (brushPosition - event.position).length() > 0.0:
			edited_pixels[brushPosition.round() as Vector2i] = color
			brushPosition = brushPosition.move_toward(event.position, 1)
		draw_pixels(edited_pixels)
		prev_mouse_position = event.position

func draw_triangle(pointA: Vector2i, pointB: Vector2i, pointC: Vector2i) -> void:
	pass

func draw_spans_between_edges(long_edge: Edge, short_edge: Edge) -> void:
	if(long_edge.yDiff == 0 || short_edge.yDiff == 0): return
	
	var factor1: float = (short_edge.y1 - long_edge.y1) / long_edge.yDiff
	var factorStep1: float = 1.0 / long_edge.yDiff
	var factor2: float = 0.0
	var factorStep2: float = 1.0 / short_edge.yDiff
	
	for y in range(short_edge.y1, short_edge.y2):
		var newSpan: Span = Span.new(long_edge.x1 + (long_edge.xDiff * factor1), short_edge.x1 + (short_edge.xDiff * factor2))
		draw_span(newSpan, y)
		factor1 += factorStep1
		factor2 += factorStep2

func draw_span(span: Span, y: float):
	if(span.x2 == 0.0): return
	#if(y >= 0 && y < canvas_ref.get_height())

# Used in draw_triangle
class Edge:
	var x1: float
	var x2: float
	var y1: float
	var y2: float
	var xDiff: float
	var yDiff: float
	
	func _init(point1: Vector2i, point2: Vector2i):
		if(point1.y < point2.y):
			x1 = point1.x
			y1 = point1.y
			x2 = point2.x
			y2 = point2.y
		else:
			x1 = point2.x
			y1 = point2.y
			x2 = point1.x
			y2 = point1.y
			
		xDiff = x2 - x1
		yDiff = y2 - y1

class Span:
	var x1: float
	var x2: float
	var xDiff: float
	
	func _init(in_x1: int, in_x2: int):
		if(in_x1 < in_x2):
			x1 = in_x1 - 1
			x2 = in_x2 + 1
		else:
			x1 = in_x2 - 1
			x2 = in_x1 + 1
		xDiff = x2 - x1
