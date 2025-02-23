extends VBoxContainer

class_name Stats

var stats = {
	"money": {
		"name": "",
		"value": 500,
		"node": "res://scenes/stats/Money.tscn",
	},
	"familiar_1": {
		"name": "Familiar 1",
		"value": 100,
		"node": "res://scenes/stats/Member.tscn"
	},
	"familiar_2": {
		"name": "Familiar 2",
		"value": 100,
		"node": "res://scenes/stats/Member.tscn"
	}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for stat_key in stats.keys():
		var stat = stats[stat_key]
		var scene: PackedScene = load(stat["node"])
		var node = scene.instantiate()
		if stat["name"] == "":
			node.sname = "%s" % stat["value"]
		else:
			node.sname = stat["name"]
		add_child(node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
