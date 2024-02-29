extends State


@export var dash_state: State
@export var air_state: State
@export var jump_force: float = -400
@export var fire_point: Marker2D





func state_process(_delta):
	if !player.is_on_floor():
		next_state = air_state
		
func state_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		jump()
	if event.is_action_pressed("shoot"):
		ground_projectile()
		
		
func jump():
	player.velocity.y = jump_force
	next_state = air_state

	
func ground_projectile():
	pass #spawn bullet at marker
	
