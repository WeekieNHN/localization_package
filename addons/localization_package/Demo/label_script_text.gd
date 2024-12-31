extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "You can also set translated text through script:\n%s." % tr("CONTEXT_CLASS_PIRATE") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
