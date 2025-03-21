extends Label

## Put this on a label, use the text_string field to write a string to insert keys into
## and write the keys into the key list

@export var text_string: String = "Does it work? 1: %s; 2: %s"
@export var key_list: Array[String] = ["CONTEXT_CHARACTER_CLASS", "CONTEXT_CLASS_GOD"]

func on_locale_change() -> void:
	text = text_string % key_list.map(tr)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect to signal for updating translation
	LocalizationManager.on_locale_changed.connect(on_locale_change)
	# Translate text
	on_locale_change()
