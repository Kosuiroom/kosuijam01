extends PlayerState


func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO


func physics_update(_delta: float) -> void:

	if Input.is_action_pressed("mvLeft") or Input.is_action_pressed("mvRight") or Input.is_action_pressed("mvUp") or Input.is_action_pressed("mvDown"):
		state_machine.transition_to("Run")
