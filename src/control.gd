extends HBoxContainer

var services := [
	"Water", 
	"Electricity", 
	"Gas"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for service in services:
		var bt = Button.new()
		bt.text = service
		add_child(bt)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
