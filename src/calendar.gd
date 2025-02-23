extends GridContainer

class_name Calendar

func _ready() -> void:
	Global.calendar = self
	draw()

func _process(delta: float) -> void:
	pass
	
func draw():
	# Remove children
	for n in get_children():
		remove_child(n)
		n.queue_free() 
	# Draw cells
	for i in range(1, 32):
		var lb = Label.new()
		if i <= Global.get_day():
			lb.set("theme_override_colors/font_color", Color.RED)
		else:
			lb.set("theme_override_colors/font_color", Color.BLACK)
		lb.text = "%s" % i
		add_child(lb)
