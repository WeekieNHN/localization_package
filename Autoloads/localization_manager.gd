extends Node

signal on_locale_changed()

## returns list of files at given path recursively
## [br]taken from - https://gist.github.com/hiulit/772b8784436898fd7f942750ad99e33e
func get_all_files(path: String, file_ext := "", files : Array[String] = []) -> Array[String]:
	var dir : = DirAccess.open(path)
	if file_ext.begins_with("."): # get rid of starting dot if we used, for example ".tscn" instead of "tscn"
		file_ext = file_ext.substr(1,file_ext.length()-1)
	
	if DirAccess.get_open_error() == OK:
		dir.list_dir_begin()

		var file_name = dir.get_next()

		while file_name != "":
			if dir.current_is_dir():
				# recursion
				files = get_all_files(dir.get_current_dir() +"/"+ file_name, file_ext, files)
			else:
				if file_ext and file_name.get_extension() != file_ext:
					file_name = dir.get_next()
					continue
				
				files.append(dir.get_current_dir() +"/"+ file_name)

			file_name = dir.get_next()
	else:
		print("[get_all_files()] An error occurred when trying to access %s." % path)
	return files

func _ready() -> void:
	# Connect timer timeout to check locale
	$LocaleCheckTimer.timeout.connect(check_locale_change)

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	# Get all of our translation files
	var translations: Array[String] = get_all_files("res://addons/localization_package/Translations/", ".translation")
	
	# Add each one to TranslationServer
	for translation in translations:
		# Create a translation object
		var t: Translation = load(translation)
		# Add translation to 
		TranslationServer.add_translation(t)
	
	# Set locale to the OS location to refresh everything
	TranslationServer.set_locale(OS.get_locale())

var prev_locale: String = ""
func check_locale_change() -> void:
	# Skip if locale hasn't changed
	if TranslationServer.get_locale() == prev_locale: return
	# Otherwise, save locale and emit signal
	prev_locale = TranslationServer.get_locale()
	on_locale_changed.emit()
