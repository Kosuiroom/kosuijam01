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
var dmgtodeal
#
###Signals
signal health_update(playerHealth)
signal fire()

###Methods
func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("fire"):
		fire()

func fire():
	emit_signal("fire")
	

func damage(amount):
		_set_health(playerHealth - amount)
		print("player took health")

func _set_health(value):
	print("health value: ", value)
	var prev_health = playerHealth
	print("prev health: ", prev_health)
	playerHealth = clamp(value, 0, MaxHealth)
	print("player health ", playerHealth)

	if playerHealth != prev_health:
		emit_signal("health_update", playerHealth)
		if playerHealth <= 0:
			IsKilled()

func takeDmg():
	damage(1)

func IsKilled():
	print("player died")
	pass


func _on_hurtbox_body_entered(body):
	if "Monster" in body.name:
		if !hurtbox.is_invinc:
			blinker.start_blinking(self, invincibility)
			hurtbox.start_invinc(invincibility)
			takeDmg()
		
