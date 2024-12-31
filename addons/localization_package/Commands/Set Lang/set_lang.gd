extends Command

var lang_strings: Array[String]

func _ready() -> void:
	# Get the language strings
	for locale in TranslationServer.get_loaded_locales():
		# Add language string
		lang_strings.append(locale)

func run_command(args: Array[String]) -> String:
	# Make sure the user specified a locale code
	if len(args) == 0:
		# Tell user to select a locale code
		return "set_lang: No locale specified. Please select a locale from this list:\n\n%s.\n\n" % [lang_strings]
	# Check if we've specified a valid locale code in arg0
	if !lang_strings.has(args[0]):
		# Tell user to select a valid locale code
		return "set_lang: Cannot set_lang to `%s`, please select a locale from this list:\n\n%s.\n\n" % [args[0], lang_strings]
	# Valid locale code
	TranslationServer.set_locale(args[0])
	# Return an empty string
	return "Set language to locale: %s.\n" % args[0]
