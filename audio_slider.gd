extends HBoxContainer

@onready var bus_name: Label = $Bus_name
@onready var h_slider: HSlider = $HSlider
@onready var percent: Label = $Percent

var buses = ["Master", "Bgm", "Sfx"]
var number_in_tree : int

func _ready() -> void:
	number_in_tree = get_parent().get_children().find(self)
	bus_name.text = buses[number_in_tree] + " Volume"

func _on_h_slider_value_changed(value: float) -> void:
	percent.text = str(int(h_slider.value * 100)) + "%"
	AudioServer.set_bus_volume_db(number_in_tree, linear_to_db(value))
