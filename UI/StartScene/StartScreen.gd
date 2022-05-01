extends Control

onready var startbtn = $menuitems/Start

func _ready():
	startbtn.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_Start_pressed():
	Global.is_dead = false
	get_tree().change_scene("res://gamelevel/Main.tscn")


func _on_Exit_pressed():
	get_tree().quit()
