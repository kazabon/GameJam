extends State


@export var dash_state: State
@export var dash_speed: float = 500
@export var air_state: State
@export var jump_force: float = -400
var dash_dir = Input.get_axis("left", "right")




func state_process(_delta):
	if !player.is_on_floor():
		next_state = air_state
		
func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		jump()
	if event.is_action_pressed("dash"):
		dash()
		
		
func jump():
	player.velocity.y = jump_force
	next_state = air_state

func dash():
		player.velocity.x = dash_speed 
		next_state = dash_state
	
	
