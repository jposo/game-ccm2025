extends Control

var services := [
	"Water", 
	"Electricity", 
	"Gas"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for service in services:
		$OptionButton.add_item(service)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
