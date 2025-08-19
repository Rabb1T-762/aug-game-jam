extends Node

class_name State

signal transitioned(state_name: String)

var character_body: CharacterBody2D
var animated_sprite: AnimatedSprite2D

func init_state(_character: CharacterBody2D, _animated_sprite: AnimatedSprite2D) -> void:
	character_body = _character
	animated_sprite = _animated_sprite

func enter() -> void: 
	# Called when this state becomes active
	pass

func exit() -> void: 
	# Called when this state is exited
	pass

func physics_update(delta: float): 
	# Called every physics frame by the StateMachine
	pass

func update(delta: float): 
	# Called every frame by the StateMachine if needed (optional)
	pass
	
func handle_input(_event: InputEvent) -> void:
	pass
