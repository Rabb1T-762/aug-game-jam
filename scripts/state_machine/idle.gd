extends "res://scripts/state_machine/state.gd"

func enter() -> void:
	character_body.velocity.x = 0  # Stop horizontal movement
	if animated_sprite:
		animated_sprite.play("idle")

func physics_update(delta: float) -> void:
	# Handle transition to Airborn state
	if not character_body.is_on_floor():
		transitioned.emit("airborne")
		return
		
	var direction := Input.get_axis("move_left", "move_right")
	
	# Handle transition to Run state
	if direction != 0:
		transitioned.emit("run")
	
	character_body.move_and_slide()

func handle_input(event: InputEvent) -> void:
	# Handle transition to Jump state
	if Input.is_action_just_pressed("jump") and character_body.is_on_floor():
		transitioned.emit("jump")
