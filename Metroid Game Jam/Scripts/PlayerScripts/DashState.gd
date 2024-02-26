extends State
class_name DashState


@export var ground_state: State
@export var air_state: State
@export var attack_state: State 
@export var dash_timer: Timer

func enter():
	dash_timer.start()
	



func _on_timer_timeout():
	next_state = ground_state
