extends Area2D
var zonedmg = 3

func _on_Lightbeam_area():
	print("close zone fire")
	var targets = get_overlapping_bodies()
	for target in targets:
		target.damage(zonedmg)
		print("battery: ", zonedmg)
