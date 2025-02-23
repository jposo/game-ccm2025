extends Node

var journal: Journal
var calendar: Calendar
var stats: Stats
var money: Money
var day_manager: DayManager
var servicesManager: Services
var day := 1
var cash := 1000

var members = {
	"familiar_1": {
		"name": "You",
		"value": 80,
		"node": "res://scenes/stats/Member.tscn"
	},
	"familiar_2": {
		"name": "Wife",
		"value": 80,
		"node": "res://scenes/stats/Member.tscn"
	},
	"familiar_3": {
		"name": "Son",
		"value": 80,
		"node": "res://scenes/stats/Member.tscn"
	},
}

enum ServiceType {
	Weekly,
	Monthly
}

var services := {
	"Water": {
		"cost": 0,
		"type": ServiceType.Weekly,
		"lastPaid": 0,
		"enabled": false,
	},
	"Gasoline": {
		"cost": 0,
		"type": ServiceType.Weekly,
		"lastPaid": 0,
		"enabled": false,
	},
	"Groceries": {
		"cost": 0,
		"type": ServiceType.Weekly,
		"lastPaid": 0,
		"enabled": false,
	},
	"Internet": {
		"cost": 0,
		"type": ServiceType.Monthly,
		"lastPaid": 0,
		"enabled": false,
	},
	"Rent": {
		"cost": 0,
		"type": ServiceType.Monthly,
		"lastPaid": 0,
		"enabled": false,
	},
	"Electricity": {
		"cost": 0,
		"type": ServiceType.Monthly,
		"lastPaid": 0,
		"enabled": false,
	},
}

func increase_day(newCash: int, newStatYou: int, newStatWife: int, newStatSon: int, waterEnabled:bool, gasEnabled: bool, groceriesEnabled: bool, internetEnabled: bool, rentEnabled: bool, electricityEnabled: bool) -> void:
	day += 1
	if day%7==0:
		cash+=500
	cash += newCash
	if members["familiar_1"]["value"] + newStatYou > 100:
		members["familiar_1"]["value"] = 100
	else:
		members["familiar_1"]["value"] += newStatYou
	if members["familiar_2"]["value"] + newStatWife > 100:
		members["familiar_2"]["value"] = 100
	else:
		members["familiar_2"]["value"] += newStatWife
		
	if members["familiar_3"]["value"] + newStatSon > 100:
		members["familiar_3"]["value"] = 100
	else:
		members["familiar_3"]["value"] += newStatSon
		
	services["Water"]["enabled"] = waterEnabled
	services["Gasoline"]["enabled"] = gasEnabled
	services["Groceries"]["enabled"] = groceriesEnabled
	services["Internet"]["enabled"] = internetEnabled
	services["Rent"]["enabled"] = rentEnabled
	services["Electricity"]["enabled"] = electricityEnabled


func get_day() -> int:
	return day
