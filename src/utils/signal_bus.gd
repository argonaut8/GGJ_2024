extends Node

signal set_available_tools(tools: Array[Tool])
signal update_canvas
signal tool_selected(tool: Tool)
signal draw_pixels(pixels: Array[Vector2i])
