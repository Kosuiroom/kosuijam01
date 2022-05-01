extends Control

onready var chargebar = $chargebar
onready var timer = $Timer


func _on_Player_discharge():
	chargebar.value = 2
	timer.start()
	

func _on_Timer_timeout():
	if chargebar.value <= 5:
		chargebar.value += 1
		Global.batterycharge = chargebar.value
	if chargebar.value == 5:
		timer.stop()
