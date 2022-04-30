extends Node2D

var zonedmg
signal area()


#func _on_middle_body_entered(body):
#	print("middle")
#	zonedmg = 2
#	emit_signal("enemypos",zonedmg)
#	print(body.name)
#
#
#func _on_far_body_entered(body):
#	print("far")
#	zonedmg = 1
#	emit_signal("enemypos",zonedmg)
#	print(body.name)
#
#
#func _on_short_body_entered(body):
#	print("short")
#	zonedmg = 3
#	emit_signal("enemypos",zonedmg)
#	print(body.name)


func _on_Player_fire():
	emit_signal("area")
