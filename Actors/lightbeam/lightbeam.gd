extends Node2D

signal area()

func _process(delta):
	look_at(get_global_mouse_position())
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Player_fire():
	print("fired")
	emit_signal("area")
