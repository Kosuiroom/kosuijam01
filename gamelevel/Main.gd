extends Node

var enemies = preload("res://Actors/Enemy/monster.tscn")

func _on_SpawnTimer_timeout():
	var enemy = enemies.instance()
	add_child(enemy)
	enemy.position = $Spawner.position
