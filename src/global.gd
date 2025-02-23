extends Node

var journal: Journal
var calendar: Calendar
var stats: Stats
var day := 1

func increase_day() -> void:
	day += 1
	stats.stats["money"]["value"] += 100

func get_day() -> int:
	return day
