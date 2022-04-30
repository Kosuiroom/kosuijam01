extends KinematicBody2D

var run_speed = 100
var velocity = Vector2.ZERO
var direction
export(int) var MaxHealth := 3
onready var monsterHealth = MaxHealth setget _set_health
onready var player = get_node("/root/Main/Player")


func _physics_process(delta):
	if player:
		direction = position.direction_to(player.position).normalized()
		move_and_slide(direction * run_speed)


func _on_Player_dmgenemy(dmg):
	damage(dmg)

func damage(amount):
	_set_health(monsterHealth - amount)
	print("monster took health")

func _set_health(value):
	var prev_health = monsterHealth
	monsterHealth = clamp(value, 0, MaxHealth)
	
	if monsterHealth != prev_health:
		if monsterHealth <= 0:
			IsKilled()

func IsKilled():
	if "Monster" in name:
		queue_free()


func _on_dmg_body_entered(body):
	if body.name == "Player":
		body.takeDmg()
