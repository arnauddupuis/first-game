extends Control

var last_master_value = 1
var last_music_value = 1
var last_sfx_value = 1

@onready var music_volume_slider = $VBoxContainer/MusicVolumeSlider
@onready var sfx_volume_slider = $VBoxContainer/SFXVolumeSlider
@onready var master_volume_slider = $VBoxContainer/MasterVolumeSlider


func _ready():
	last_master_value = master_volume_slider.value
	last_music_value = music_volume_slider.value
	last_sfx_value = sfx_volume_slider.value

func _on_music_check_button_toggled(toggled_on):
	if toggled_on:
		last_music_value = music_volume_slider.value
		music_volume_slider.value = 0.0
	else:
		music_volume_slider.value = last_music_value


func _on_sfx_check_button_toggled(toggled_on):
	if toggled_on:
		last_sfx_value = sfx_volume_slider.value
		sfx_volume_slider.value = 0.0
	else:
		sfx_volume_slider.value = last_sfx_value


func _on_master_check_button_toggled(toggled_on):
	if toggled_on:
		last_master_value = master_volume_slider.value
		master_volume_slider.value = 0.0
	else:
		master_volume_slider.value = last_master_value


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_main.tscn")
