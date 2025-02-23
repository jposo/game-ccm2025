extends Node2D

class_name Main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.main = self
	$Popup.visible = false

func show_popup() -> void:
	$Popup.visible = true

func _on_button_pressed() -> void:
	get_tree().quit()
	#get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
