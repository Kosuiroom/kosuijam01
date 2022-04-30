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
	print("dmg ataken to monster: ", dmg )
	damage(dmg)

func damage(amount):
	_set_health(monsterHealth - amount)
	print("monster took health")

func _set_health(value):
	print("health value: ", value)
	var prev_health = monsterHealth
	print("prev health: ", prev_health)
	monsterHealth = clamp(value, 0, MaxHealth)
	print("monster health ", monsterHealth)
	
	if monsterHealth != prev_health:
		if monsterHealth <= 0:
			IsKilled()

func IsKilled():
	print("monster died: ", name)
	if "Monster" in name:
		queue_free()
