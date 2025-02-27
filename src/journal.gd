extends Node2D

class_name Journal

enum Tab {
	Story,
	Resources,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.journal = self
	$AnimatedSprite2D.play()
	$Content.visible = false
	await $AnimatedSprite2D.animation_finished
	$Content.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
