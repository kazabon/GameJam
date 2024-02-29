extends State

@export var ground_state: State
@export var double_jump_force: float = -300
@export var extra_jump_count: int = 2
@export var wall_state: State
@export var ceiling_state: State
var max_jump_count:int = 2
var can_double_jump: bool 

func enter():
	can_double_jump = true
	extra_jump_count = max_jump_count


func state_process(_delta):
	if player.is_on_floor():
		next_state = ground_state
		
	if player.is_on_wall_only():
		next_state = wall_state
	
	
		
func state_input(event: InputEvent):
	if event.is_action_pressed("jump") && can_double_jump:
		double_jump()
		
func double_jump():
	player.velocity.y = double_jump_force
	extra_jump_count -= 1
	if extra_jump_count == 0:
		can_double_jump = false
	
