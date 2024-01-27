class_name RandomPrompts
extends RefCounted

const prompt_structure_list: Array[String] = [
	"The Essence of %s",
	"%s Graduation",
	"The Source of All %s",
	"A %s's Favorite Breakfast",
	"%s",
	"%s.",
	"%s!",
	"%s?",
	"Like a %s, But On Low Battery",
	"Could it be %s?",
	"What, Not %s!",
	"I can't believe it's not %s!",
	"The Sensation You Get when Staring into the Eyes of a %s",
	"%s Party",
	"If Nobody Got Me I Know %s Got Me. Can I Get an Amen?",
	"Honestly I'm curious what happens if I just put a really long prompt into this textbox. Also %s",
	"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa %s",
	"The %s Machine",
	"Approximate %s",
	"The one who seeks %s",
	"%s... 2!!",
	"Antithetical %s",
	"I can't think of a prompt so try drawing a %s",
	"None of the Other Kids At School Know I'm Secretly a %s",
	"Help Me! I'm Turning into a %s!",
	"Super%s",
	"A Bucket of %s",
	"%s's House",
	"Too Much %s",
	"Kingdom of %s",
	"Praise the %s!",
	"Big Friendly %s",
	"Alarmingly Hyperrealistic %s",
	"Universal %s",
	"Two %ss in a trenchcoat",
	"The %s Store",
	"Poorly Drawn %s",
	"3.7 %ss",
	"I wish %s could fly",
	"%s for a Change",
	"%s Without a Cause",
	"The Weird and Wacky World of %s",
	"%s-themed Amusement Park",
	"%s-themed Restaurant",
	"Einstein's Theory of %s",
	"Monument to %s",
	"%s National Park",
	"A Field of Grazing %ss",
	"At Least 15 %ss",
	"%s Therapy",
	"Chronic %s",
	"Ultimate %s",
	"%s Tournament",
	"Just Way Too Many %s",
	"Hangering for a %s",
	"%s-starved",
	"Cardboard Cutout of %s",
	"What's that in the sky, a %s?",
	"What are you, a %s?",
	"Lost in the %s Dimension",
	"It's a shame a family can be torn apart by a pack of %s",
	"%s: The Musical",
	"Tower of %s"
]

const prompt_noun_list: Array[String] = [
	"Snowman",
	"Turkey",
	"Grief",
	"Tuesday",
	"Barnacle",
	"Saturday",
	"[REDACTED]",
	"Magic",
	"Dog",
	"Demon",
	"Sleep",
	"Pancake",
	"Danny DeVito",
	"Mothman",
	"Nessie",
	"Tweezers",
	"Refridgerator",
	"Milk",
	"Sun",
	"-- I couldn't think of a punchline. You'll have to figure this out yourself I'm sorry",
	"Mycelium",
	"Punching",
	"Violence",
	"Really Wet Snails",
	"Soup",
	"Restaurant",
	"Box Fan",
	"Pythagorean Theorem",
	"Margarine",
	"Hot Dog",
	"Sandwich",
	"Galaxy"
]

func pick_random_prompt() -> String:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var prompt_strucutre: String = prompt_structure_list[rng.randi_range(0, prompt_structure_list.size()-1)] 
	var prompt_noun: String = prompt_noun_list[rng.randi_range(0, prompt_noun_list.size()-1)]
	return prompt_strucutre % prompt_noun
