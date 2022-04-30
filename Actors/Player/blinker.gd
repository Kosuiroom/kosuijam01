extends Node

onready var blinktimer = $blinktimer
onready var durationtimer = $durationtimer
var blinkobj = Node2D

func start_blinking(object,duration):
	blinkobj = object
	durationtimer.wait_time = duration
	durationtimer.start()
	blinktimer.start()


func _on_blinktimer_timeout():
	blinkobj.visible = !blinkobj.visible


func _on_durationtimer_timeout():
	blinktimer.stop()
	blinkobj.visible = true
