extends KinematicBody2D

var run_speed = 100
var velocity = Vector2.ZERO
var direction
onready var player = get_node("/root/Main/Player")

func _physics_process(delta):

	if player:
		direction = position.direction_to(player.position).normalized()
		move_and_slide(direction * run_speed)


