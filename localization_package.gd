@tool
extends EditorPlugin

# Replace this value with a PascalCase autoload name, as per the GDScript style guide.
const AUTOLOAD_NAME = "LocalizationManager"


func _enable_plugin():
	# The autoload can be a scene or script file.
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/localization_package/Autoloads/localization_manager.tscn")


func _disable_plugin():
	remove_autoload_singleton(AUTOLOAD_NAME)
