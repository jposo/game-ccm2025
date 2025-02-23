extends HBoxContainer

class_name Services

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.servicesManager = self
	for service_name in Global.services.keys():
			var service = Global.services[service_name]
			print(service_name, " habilitado: ", service.enabled)
			if (service.enabled):
				$OptionButton.add_item(service_name)
				
func draw() -> void:
	for service_name in Global.services.keys():
		var service = Global.services[service_name]
		print(service_name, " habilitado: ", service.enabled)
		
		if (service.enabled):
			var already_added := false
			for i in range($OptionButton.get_item_count()):
				if $OptionButton.get_item_text(i) == service_name:
					already_added = true
					break
			
			if not already_added:
				$OptionButton.add_item(service_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
