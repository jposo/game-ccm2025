extends HBoxContainer

class_name Stats

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
	for memb_key in Global.members.keys():
		var stat = Global.members[memb_key]
		var scene: PackedScene = load(stat["node"])
		var node = scene.instantiate()
		if stat["name"] == "":
			node.sname = "%s" % stat["name"]
		else:
			node.sname = "%s" % stat["name"]
			node.value = stat["value"]
		add_child(node)
