extends Area2D

const whiten_duration = 0.15
export (ShaderMaterial) var whiten_material
onready var colshape = $CollisionShape2D
var is_invinc = false

func start_invinc(incinv_duration):
	is_invinc = true
	colshape.set_deferred("disabled", true)
	yield(get_tree().create_timer(incinv_duration), "timeout")
	colshape.set_deferred("disabled", false)
	is_invinc = false

func _on_hurtbox_body_entered(body):
	whiten_material.set_shader_param("whiten",true)
	yield(get_tree().create_timer(whiten_duration), "timeout")
	whiten_material.set_shader_param("whiten",false)
