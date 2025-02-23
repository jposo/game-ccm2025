extends Node

var journal: Journal
var calendar: Calendar
var stats: Stats
var money: Money
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

func increase_day() -> void:
	day += 1
	cash += 100

func get_day() -> int:
	return day
