extends Control

onready var label = $CenterContainer/VBoxContainer/Label

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	label.text = str("Final score:",Global.score)


func _on_Exit_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://UI/StartScene/StartScreen.tscn")
