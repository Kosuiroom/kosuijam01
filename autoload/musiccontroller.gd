extends Node

var title = load("res://Sound/Gamejam_titlescreen_2.mp3")
var game = load("res://Sound/Gameplay.mp3")

func _ready():
	pass
	
	
func play():
	$music.stream = title
	$music.play()

func playgame():
	$music.stream = game
	$music.play()

func stopplay():
	$music.stop()
	
func stopgame():
	$music.stop()
