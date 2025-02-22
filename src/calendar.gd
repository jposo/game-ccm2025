extends GridContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(1, 32):
		var lb = Label.new()
		lb.text = "%s" % i
		add_child(lb)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
