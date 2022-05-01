extends Node

var enemies = preload("res://Actors/Enemy/monster.tscn")
onready var spawn1 = $Spawner
onready var spawnsound2 = $Spawner/spawnsound

func _on_SpawnTimer_timeout():
	var enemy = enemies.instance()
	add_child(enemy)
	enemy.position = $Spawner.position
	spawnsound2.play()

func _on_SpawnTimer2_timeout():
	var enemy = enemies.instance()
	add_child(enemy)
	enemy.position = $Spawner2.position
	spawnsound2.play()
