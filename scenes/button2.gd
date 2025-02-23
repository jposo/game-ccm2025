extends Button

var file = "res://src/days.json"
var json_as_text = FileAccess.get_file_as_string(file)
var events = JSON.parse_string(json_as_text)
var newCash: int = 0

func _ready() -> void:
	update_button2_text()

func update_button2_text() -> void:
	var current_day = Global.get_day()
	var key = str(current_day)
	var event = events[key]
	
	
	
	newCash = 0
	if event["prompt"]["outcomes"].size() > 1:
		var second_outcome = event["prompt"]["outcomes"][1]
		text = "%s" % second_outcome["description"]
		for res in second_outcome["result"]:
			if res.has("stat") and res["stat"] == "money":
				newCash += res["delta"]
		visible = true 
	else:
		visible = false 



func _on_button_up() -> void:
	Global.increase_day(newCash)
	Global.calendar.draw()
	Global.stats.draw()
	Global.money.draw()
	Global.day_manager.draw()
	
	update_button2_text()
	var option1_button = get_parent().get_node("Continue")
	if option1_button:
		option1_button.update_button_text()
