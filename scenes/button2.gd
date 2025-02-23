extends Button

var file = "res://src/days.json"
var json_as_text = FileAccess.get_file_as_string(file)
var events = JSON.parse_string(json_as_text)

var newCash: int = 0
var newStatYou: int = 0
var newStatWife: int = 0
var newStatSon: int = 0

var waterEnabled: bool = false
var gasEnabled: bool = false
var groceriesEnabled: bool = false
var internetEnabled: bool = false
var rentEnabled: bool = false
var electricityEnabled: bool = false

func _ready() -> void:
	update_button2_text()

func update_button2_text() -> void:
	var current_day = Global.get_day()
	var key = str(current_day)
	var event = events[key]

	newCash = 0
	newStatYou = 0
	newStatWife = 0
	newStatSon = 0
	
	waterEnabled = false
	gasEnabled = false
	groceriesEnabled = false
	internetEnabled = false
	rentEnabled = false
	electricityEnabled = false
	
	if event["prompt"]["outcomes"].size() > 1:
		var second_outcome = event["prompt"]["outcomes"][1]
		text = "%s" % second_outcome["description"]
		
		for res in second_outcome["result"]:
			# Manejo de estadísticas de dinero y salud
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
			
			if res.has("newOption"):
				match res["newOption"]:
					"water":
						waterEnabled = true
					"gas":
						gasEnabled = true
					"grocery shopping":
						groceriesEnabled = true
					"internet":
						internetEnabled = true
					"rent":
						rentEnabled = true
					"electricity":
						electricityEnabled = true

		visible = true 
	else:
		visible = false 

func _on_button_up() -> void:
	Global.increase_day(newCash, newStatYou, newStatWife, newStatSon, 
						waterEnabled, gasEnabled, groceriesEnabled, 
						internetEnabled, rentEnabled, electricityEnabled)
	Global.calendar.draw()
	Global.stats.draw()
	Global.money.draw()
	Global.day_manager.draw()
	Global.servicesManager.draw()
	
	update_button2_text()
	var option1_button = get_parent().get_node("Continue")
	if option1_button:
		option1_button.update_button_text()
