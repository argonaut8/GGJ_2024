class_name RandomPrompts
extends RefCounted

const prompt_structure_list: Array[String] = [
	"The Essence of %s",
	"%s Graduation",
	"The Source of All %s",
	"A %s's Favorite Breakfast",
	"%s"
]

const prompt_noun_list: Array[String] = [
	"Snowman",
	"Turkey",
	"Grief",
	"Tuesday",
	"Barnacle"
]

func pick_random_prompt() -> String:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var prompt_strucutre: String = prompt_structure_list[rng.randi_range(0, prompt_structure_list.size()-1)] 
	var prompt_noun: String = prompt_noun_list[rng.randi_range(0, prompt_noun_list.size()-1)]
	return prompt_strucutre % prompt_noun
