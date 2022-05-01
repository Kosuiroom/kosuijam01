extends Control

onready var progress = $TextureRect/TextureProgress

func _on_Player_health_update(playerHealth):
	progress.value = playerHealth
