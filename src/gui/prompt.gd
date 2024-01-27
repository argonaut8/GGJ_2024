class_name Prompt
extends PanelContainer

@onready var prompt_label = $"%PromptLabel"

func _ready():
	prompt_label.text = RandomPrompts.new().pick_random_prompt()
