extends Node2D

@export_file var ribbon_asset: String = "res://assets/Sprites/Content/Side Tabs/Tab Animated/5.png"
@export_file var icon_asset: String = "res://assets/Sprites/Content/Side Tabs/3.png"
@export var tab: Journal.Tab

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Ribbon.texture = load(ribbon_asset)
	$Icon.texture = load(icon_asset)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		print('clicked', tab)
