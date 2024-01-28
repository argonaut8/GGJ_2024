class_name Prompt
extends PanelContainer

@onready var prompt_label = $"%PromptLabel"

func set_prompt(prompt: String) -> void:
	prompt_label.text = prompt
