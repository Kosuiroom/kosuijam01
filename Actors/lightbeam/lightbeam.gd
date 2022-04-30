extends Node2D

signal area()

func _on_Player_fire():
	print("fired")
	emit_signal("area")
