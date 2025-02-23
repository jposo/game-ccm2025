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
		"node": "res://scenes/stats/Member.tscn"
	},
	"familiar_2": {
		"name": "Wife",
		"node": "res://scenes/stats/Member.tscn"
	},
	"familiar_3": {
		"name": "Son",
		"node": "res://scenes/stats/Member.tscn"
	},
}

func increase_day(newCash: int) -> void:
	day += 1
	cash += newCash

func get_day() -> int:
	return day
