extends Command

var lang_strings: Array[String]
var lang_index: int = 0
var enabled: bool = false

func _ready() -> void:
	# Get the language strings
	for locale in TranslationServer.get_loaded_locales():
		# Add language string
		lang_strings.append(locale)

func run_command(args: Array[String]) -> String:
	# Toggle if this enabled
	enabled = !enabled
	# If just enabled, set index to 0
	if enabled: lang_index = 0
	# Otherwise, return to system locale
	else: TranslationServer.set_locale(OS.get_locale())
	# Return an empty string
	return "Shuffling Languages: %s.\n" % str(enabled)

var acc: float = 0.0
var timer: float = 0.1
func _physics_process(delta: float) -> void:
	# Only run if enabled
	if !enabled: return
	# Increment Timer
	acc += delta
	# Check if we should move to the next language
	if acc > timer:
		# Increment index
		lang_index += 1
		# Set locale
		TranslationServer.set_locale(lang_strings[lang_index % len(lang_strings)])
		# Reset timer
		acc = 0.0
