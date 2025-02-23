extends Button

var file = "res://src/days.json"
var json_as_text = FileAccess.get_file_as_string(file)
var events = JSON.parse_string(json_as_text)

var newCash: int = 0
var newStatYou: int = 0
var newStatWife: int = 0
var newStatSon: int = 0

func _ready() -> void:
	update_button_text()

func update_button_text() -> void:
	var current_day = Global.get_day()
	var key = str(current_day)
	var event = events[key]
	
	newCash = 0
	newStatYou = 0
	newStatWife = 0
	newStatSon = 0
	
	if event["prompt"]["outcomes"].size() > 0:
		var first_outcome = event["prompt"]["outcomes"][0]
		text = "%s" % first_outcome["description"]
		for res in first_outcome["result"]:
			if res.has("stat"):
				if res["stat"] == "money":
					newCash += res["delta"]
				elif res["stat"] == "health":
					
					match res["member"]:
						"you":
							newStatYou += res["delta"]
						"wife":
							newStatWife += res["delta"]
						"son":
							newStatSon += res["delta"]

func _on_button_up() -> void:
	Global.increase_day(newCash, newStatYou, newStatWife, newStatSon, false, false, false, false, false, false)
	Global.calendar.draw()
	Global.stats.draw()
	Global.money.draw()
	Global.day_manager.draw()
	
	update_button_text()
	var option2_button = get_parent().get_node("Button")
	if option2_button:
		option2_button.update_button2_text()
