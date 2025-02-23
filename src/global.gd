extends Node

var journal: Journal
var calendar: Calendar
var stats: Stats
var money: Money
var day_manager: DayManager
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
	Monthly,
}

var services := {
	"Water": {
		"cost": 100,
		"type": ServiceType.Weekly,
		"lastPaid": 0,
		"enabled": false,
	},
	"Gasoline": {
		"cost": 300,
		"type": ServiceType.Weekly,
		"lastPaid": 0,
		"enabled": false,
	},
	"Groceries": {
		"cost": 100,
		"type": ServiceType.Weekly,
		"lastPaid": 0,
		"enabled": false,
	},
	"Internet": {
		"cost": 300,
		"type": ServiceType.Monthly,
		"lastPaid": 0,
		"enabled": true,
	},
	"Rent": {
		"cost": 1500,
		"type": ServiceType.Monthly,
		"lastPaid": 0,
		"enabled": true,
	},
	"Electricity": {
		"cost": 300,
		"type": ServiceType.Monthly,
		"lastPaid": 0,
		"enabled": true,
	},
}

func increase_day(newCash: int, newStatYou: int, newStatWife: int, newStatSon: int) -> void:
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
	

func get_day() -> int:
	return day
