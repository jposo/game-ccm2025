extends Node

class_name Stat

@export var sname: String
@export var value: int = 80

var happy = preload("res://mats/happy.tres")
var mid = preload("res://mats/mid.tres")
var sad = preload("res://mats/sad.tres")
var satisfied = preload("res://mats/satisfied.tres")


func _ready():
	$Label.text = sname
	update_sprite(value)
	$ProgressBar.value = value

func update_sprite(health: int) -> void: 
	if $MarginContainer/AnimatedSprite2D != null:
		if health > 75: 
			$MarginContainer/AnimatedSprite2D.sprite_frames = happy
			$MarginContainer/AnimatedSprite2D.play()
		elif health > 50:
			$MarginContainer/AnimatedSprite2D.sprite_frames = satisfied
			$MarginContainer/AnimatedSprite2D.play()
		elif health > 25: 
			$MarginContainer/AnimatedSprite2D.sprite_frames = mid
			$MarginContainer/AnimatedSprite2D.play()
		elif health > 0: 
			$MarginContainer/AnimatedSprite2D.sprite_frames = sad
			$MarginContainer/AnimatedSprite2D.play()
