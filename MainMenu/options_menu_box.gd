extends VBoxContainer

var Audio 

func  _ready():
	AudioServer.set_bus_layout(load("res://default_bus_layout.tres"))
	$VolumeBox/Volume.value = AudioServer.get_bus_volume_db(0)

func _on_back_pressed():
	get_parent().get_child(1).show()
	get_tree().queue_delete(self)


func _on_data_wipe_button_pressed():
	$DataWipeButton.text = "DATA WIPED"
	$DataWipeButton.disabled = true
	Highscore.destroy_data()


func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
	if value == -20:
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false)
