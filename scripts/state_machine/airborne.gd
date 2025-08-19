extends "res://scripts/state_machine/state.gd"

func enter() -> void:
	if animated_sprite:
		animated_sprite.play("jump")

func _physics_process(delta: float) -> void:
	# Apply gravity
	character_body.velocity += character_body.get_gravity() * delta
	
	# Maintain horizontal mmovement
	# Get movement input
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip sppprite based on direction
	if direction > 0:
		animated_sprite.flip_h = false
	if direction < 0: 
		animated_sprite.flip_h = true
	
	# Apply movement 
	character_body.velocity.x = direction * character_body.SPEED
	
	# Transition to idle or run when landing
	if character_body.is_on_floor():
		if direction == 0:
			transitioned.emit("idle")
			return
		
		transitioned.emit("run")
		return
	
	character_body.move_and_slide()
	
