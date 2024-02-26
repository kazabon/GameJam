extends State

@export var ground_state: State

func state_process(_delta):
	if player.is_on_floor():
		next_state = ground_state
		
