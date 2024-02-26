extends Node
class_name PlayerStateMachine

@export var player: CharacterBody2D
@export var current_state: State
var states: Array[State]

func _ready():
	for child in get_children():
		if child is State:
			states.append(child)
		
			child.player = player
		else:
			push_warning("Child" +child.name+ "is not a valid state")
			
func _physics_process(delta):
	if current_state.next_state != null:
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)
	
func can_move_check():
	return current_state.can_move
func can_dash_check():
	return current_state.can_dash
	
	
func switch_states(new_state :State):
	if current_state != null:
		current_state.exit()
		current_state.next_state = null
	
	current_state = new_state
	current_state.enter()

func _input(event: InputEvent):
	current_state.state_input(event)
