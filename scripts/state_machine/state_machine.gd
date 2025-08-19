extends Node

var current_state: State
var states: Dictionary = {}
var character_body: CharacterBody2D
var animated_sprite: AnimatedSprite2D

func _ready():
	# Find all child nodes that are States
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(_on_state_transitioned)

func init(character_body_reference: CharacterBody2D, sprite: AnimatedSprite2D) -> void:
	character_body = character_body_reference
	animated_sprite = sprite
	for state in states.values():
		state.init_state(character_body, animated_sprite)
		
	if states.has("idle"):
		current_state = states["idle"]
		current_state.enter()


func physics_process(delta):
	if current_state:
		current_state.physics_update(delta)


func _process(delta):
	if current_state:
		current_state.update(delta)

func handle_input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)

func _on_state_transitioned(new_state_name: String) -> void:
	var new_state = states.get(new_state_name.to_lower())
	if new_state and new_state != current_state:
		current_state.exit()
		current_state = new_state
		current_state.enter()
