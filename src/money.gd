extends HBoxContainer

class_name Money

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.money = self
	draw()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func draw() -> void:
	$Label.text = "%s" % Global.cash
