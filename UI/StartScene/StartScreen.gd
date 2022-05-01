extends Control

onready var startbtn = $menuitems/Start

func _ready():
	startbtn.grab_focus()
	
func _on_Start_pressed():
	get_tree().change_scene("res://gamelevel/Main.tscn")


func _on_Exit_pressed():
	get_tree().quit()
