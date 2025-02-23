extends Node

var journal: Journal
var calendar: Calendar
var stats: Stats
var money: Money
var day := 1
var cash := 1000

func increase_day() -> void:
	day += 1
	cash += 100

func get_day() -> int:
	return day
