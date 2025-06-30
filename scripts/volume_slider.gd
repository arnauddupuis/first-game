extends HSlider

@export var audio_bus_name := "Master"

@onready var bus_id := AudioServer.get_bus_index(audio_bus_name)

func _ready():
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_id))


func _on_value_changed(value):
	AudioServer.set_bus_volume_db(bus_id, linear_to_db(value))
