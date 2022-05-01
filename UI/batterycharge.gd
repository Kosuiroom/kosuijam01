extends Control

onready var chargebar = $chargebar
onready var timer = $Timer


func _on_Player_discharge():
	chargebar.value = 2
	timer.start()
	

func _on_Timer_timeout():
	if chargebar.value <= 5:
		$charging.play()
		chargebar.value += 1
		Global.batterycharge = chargebar.value
		print("charge val: ", Global.batterycharge)
	if chargebar.value == 5:
		timer.stop()
