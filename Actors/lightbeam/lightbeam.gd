extends Node2D

func _on_middle_body_entered(body):
	print("middle")
	print(body.name)


func _on_far_body_entered(body):
	print("far")
	print(body.name)


func _on_short_body_entered(body):
	print("short")
	print(body.name)

