extends VBoxContainer

class_name DayManager

var file = "res://src/days.json"
var json_as_text = FileAccess.get_file_as_string(file)
var events = JSON.parse_string(json_as_text)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.day_manager = self
	draw()

func draw() -> void:
	var key := "%s" % Global.get_day()
	var event = events[key]
	$Label.text = "%s %s" % [event["message"], event["prompt"]["message"]]
	for outcome in event["prompt"]["outcomes"]:
		if outcome["result"]:
			print("Do thing")
