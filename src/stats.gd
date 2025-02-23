extends HBoxContainer

class_name Stats

var stats = {
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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.stats = self
	draw()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func draw() -> void:
	# Remove children
	for n in get_children():
		remove_child(n)
		n.queue_free() 
	for stat_key in stats.keys():
		var stat = stats[stat_key]
		var scene: PackedScene = load(stat["node"])
		var node = scene.instantiate()
		if stat["name"] == "":
			node.sname = "%s" % stat["value"]
		else:
			node.sname = stat["name"]
		add_child(node)
