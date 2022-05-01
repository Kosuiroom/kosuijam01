class_name Player
extends KinematicBody2D
###Node initialization
onready var fsm := $StateMachine
const invincibility = 1.5
onready var hurtbox = $hurtbox
onready var blinker = $blinker

###Player stats
var velocity
export var PlayerSpeed := 200.0
export(int) var MaxHealth := 3
onready var playerHealth = MaxHealth setget _set_health
onready var sprite = $AnimatedSprite
#
###Signals
signal health_update(playerHealth)
signal fire()
signal discharge()

###Methods
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("fire") and Global.batterycharge >= 5 and !Global.is_dead:
		Global.batterycharge = 2
		fire()

func fire():
	$attack.play()
	$lightbeam/Light2D.set_energy(2.4)
	$lightbeam/Light2D2.set_energy(2.2)
	$lightbeam/Light2D3.set_energy(2)
	emit_signal("fire")
	emit_signal("discharge")
	yield(get_tree().create_timer(1), "timeout")
	$lightbeam/Light2D.set_energy(1.27)
	$lightbeam/Light2D2.set_energy(1.27)
	$lightbeam/Light2D3.set_energy(1.27)

func damage(amount):
		$dmgd.play()
		_set_health(playerHealth - amount)

func _set_health(value):
	var prev_health = playerHealth
	playerHealth = clamp(value, 0, MaxHealth)

	if playerHealth != prev_health:
		emit_signal("health_update", playerHealth)
		if playerHealth <= 0:
			IsKilled()

func takeDmg():
	damage(1)

func IsKilled():
	Global.is_dead = true
	print("player died")
	Global.batterycharge = 5
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://UI/deathscreen/deathscene.tscn")


func _on_hurtbox_body_entered(body):
	if "Monster" in body.name:
		if !hurtbox.is_invinc:
			blinker.start_blinking(self, invincibility)
			hurtbox.start_invinc(invincibility)
			takeDmg()
		
