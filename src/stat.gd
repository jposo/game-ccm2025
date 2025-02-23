extends Node

class_name Stat

@export var sname: String
@export var value: int = 500

func _ready():
	$Label.text = sname
	if $MarginContainer/AnimatedSprite2D != null:
		$MarginContainer/AnimatedSprite2D.play()
