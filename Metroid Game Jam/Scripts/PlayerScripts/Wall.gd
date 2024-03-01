extends State

@export var ground_state: State
@export var air_state: State
@export var wall_cast: RayCast2D
var jump_force:float = -400
var jump_direction:float = 400
var gravity:float = 5
var is_slide:bool = false

func state_process(delta):
	if player.is_on_floor():
		next_state = ground_state
	if !player.is_on_floor() && !player.is_on_wall():
		next_state = air_state
		
	wall_slide(delta)
	
	
		
func jump_right():
	if player.is_on_wall():
		player.velocity.y = jump_force
		player.velocity.x = jump_direction 
		
		
func jump_left():
	if player.is_on_wall():
		player.velocity.y = jump_force
		player.velocity.x = -jump_direction
	
	
func wall_slide(delta):
	if player.is_on_wall_only():
		player.velocity.y += gravity * delta
		player.velocity.y = min(player.velocity.y, gravity)
	
func state_input(event: InputEvent):
	if event.is_action_pressed("jump") and event.is_action_pressed("right"):
		jump_left()
	elif event.is_action_pressed("jump"):
		jump_right()
		
	if event.is_action_pressed("left") or event.is_action_pressed("right"):
		is_slide = true
	else:
		is_slide = false
