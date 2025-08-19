extends "res://scripts/state_machine/state.gd"

func enter() -> void:
	if animated_sprite:
		animated_sprite.play("run")
		
func physics_update(delta: float) -> void:
	# Tranition to airborne if not on floor
	if not character_body.is_on_floor():
		transitioned.emit("airborne")
		return
		
	# Get movement input
	var direction = Input.get_axis("move_left", "move_right")
	
	# Transition to idle if character isn't moving
	if direction == 0: 
		transitioned.emit("idle")
		return
	
	# Flip sppprite based on direction
	if direction > 0:
		animated_sprite.flip_h = false
	if direction < 0: 
		animated_sprite.flip_h = true
	
	# Apply movement 
	character_body.velocity.x = direction * character_body.SPEED
	
	character_body.move_and_slide()

func handle_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump") and character_body.is_on_floor():
		transitioned.emit("jump")
