extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -320.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: Node = $StateMachine

func _ready() -> void:
	# Initialize the state machine with the initial state
	state_machine.init(self, animated_sprite)
	
func _physics_process(delta: float) -> void:
	# Delegate physics processing to the state machine
	state_machine.physics_process(delta)

func _input(event: InputEvent) -> void:
	# Delegate input handling to the state machine
	state_machine.handle_input(event)
