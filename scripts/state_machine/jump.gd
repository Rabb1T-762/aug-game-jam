extends "res://scripts/state_machine/state.gd"

func enter() -> void:
	# Play jump animation and apply jump velocity
	if animated_sprite:
		animated_sprite.play("jump")
	character_body.velocity.y = character_body.JUMP_VELOCITY
	
	# Immediately transition to Airborne state
	transitioned.emit("airborne")
	
func physics_update(delta: float) -> void:
	# No physics processing needed 
	pass
