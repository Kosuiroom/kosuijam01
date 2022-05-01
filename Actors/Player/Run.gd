extends PlayerState

func physics_update(delta: float) -> void:
	if !Global.is_dead:
		var input_direction:= Vector2(
			Input.get_action_strength("mvRight") - Input.get_action_strength("mvLeft"),
			Input.get_action_strength("mvDown") - Input.get_action_strength("mvUp")
		)
		
		player.sprite.play("walking")
		if input_direction.x < 0:
			player.sprite.flip_h = true
		else:
			player.sprite.flip_h = false
		
		if input_direction.length() > 1.0:
			input_direction = input_direction.normalized()
			
		player.velocity = player.move_and_slide(player.PlayerSpeed * input_direction)

		if player.velocity == Vector2.ZERO:
			state_machine.transition_to("Idle")
