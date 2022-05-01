extends Node

var title = load("res://Sound/Gamejam_titlescreen.mp3")

func _ready():
	pass
	
	
func play():
	$music.stream = title
	$music.play()
