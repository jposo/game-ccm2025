extends Node2D

class_name Journal

enum Tab {
	Story,
	Resources,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.journal = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
