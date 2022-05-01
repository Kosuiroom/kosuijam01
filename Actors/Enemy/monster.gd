extends KinematicBody2D

var run_speed = 100
var velocity = Vector2.ZERO
var direction
export(int) var MaxHealth := 3
onready var monsterHealth = MaxHealth setget _set_health
onready var player = get_node("/root/Main/Player")
onready var detectplayer = $playerdetect


func _physics_process(delta):
	if player:
		direction = position.direction_to(player.position).normalized()
		move_and_slide(direction * run_speed)
		
		if direction.x < 0:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false


func _on_Player_dmgenemy(dmg):
	damage(dmg)

func damage(amount):
	_set_health(monsterHealth - amount)
	print("monster took dmg", amount)

func _set_health(value):
	var prev_health = monsterHealth
	monsterHealth = clamp(value, 0, MaxHealth)
	
	if monsterHealth != prev_health:
		if monsterHealth <= 0:
			IsKilled()

func IsKilled():
	if "Monster" in name:
		Global.score += 100
		$enemydeath.play()
		run_speed = 0
		yield(get_tree().create_timer(1), "timeout")
		queue_free()

func _on_playerdetect_body_entered(body):
	print("player detected")
	$AnimatedSprite.play("Attack")


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("Walking")
