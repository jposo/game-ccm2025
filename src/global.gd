extends Node

var journal: Journal
var calendar: Calendar
var day := 1

func increase_day() -> void:
	day += 1

func get_day() -> int:
	return day
