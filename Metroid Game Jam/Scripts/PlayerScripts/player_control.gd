extends CharacterBody2D
class_name PlayerController

@export var hp: int
@export var move_speed: float = 200
@export var state_machine: PlayerStateMachine
@export var gravity: float = 30




func _physics_process(delta):
	move()
	apply_gravity()
	move_and_slide()
	
func move():
	var direction = Input.get_axis("left", "right")
	if direction !=0 && state_machine.can_move_check():
		velocity.x = direction * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)

func apply_gravity():
		velocity.y += gravity
