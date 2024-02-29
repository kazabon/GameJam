extends State
class_name DashState


@export var ground_state: State
@export var air_state: State
@export var attack_state: State 
@export var dash_timer: Timer
@export var jump_power: float = 900

func enter():
	dash_timer.start()

func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		super_jump()
	
func _on_timer_timeout():
	if next_state == ground_state:
		next_state = ground_state
	else:
		next_state = air_state

func super_jump():
	player.velocity.y = jump_power
