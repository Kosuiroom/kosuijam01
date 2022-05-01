extends Area2D
var zonedmg = 2

func _on_Lightbeam_area():
	print("middle zone fire")
	var targets = get_overlapping_bodies()
	for target in targets:
		target.damage(zonedmg)
		print("battery: ", zonedmg)
