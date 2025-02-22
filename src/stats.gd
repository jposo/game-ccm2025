extends Control

class_name Stats

var stats = {
	"familiar_1": {
		"name": "Familiar 1",
		"value": 100,
		"texture": "res://assets/Sprites/Content/Hearts/Health Heart/Idle/1.png"
	},
	"familiar_2": {
		"name": "Familiar 2",
		"value": 100,
		"texture": "res://assets/Sprites/Content/Hearts/Health Heart/Idle/1.png"
	}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for stat_key in stats.keys():
		var tr := TextureRect.new()
		tr.texture = load(stats[stat_key]["texture"])
		tr.set_expand_mode(TextureRect.EXPAND_FIT_WIDTH)
		var lb := Label.new()
		lb.text = stats[stat_key]["name"]
		var hbox = HBoxContainer.new()
		hbox.add_child(tr)
		hbox.add_child(lb)
		$VBoxContainer.add_child(hbox)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
