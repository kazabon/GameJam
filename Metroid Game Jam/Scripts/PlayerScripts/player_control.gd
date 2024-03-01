extends CharacterBody2D
class_name PlayerController

@export var hp: int
@export var move_speed: float = 200
@export var state_machine: PlayerStateMachine
@export var gravity: float = 30
@export var dash_speed: float = 900
@export var dash_state: State
@export var dash_cooldown: Timer
var is_dashing: bool = false
@export var right_hit: CollisionShape2D
@export var left_hit: CollisionShape2D



func _physics_process(delta):
	move()
	apply_gravity()
	move_and_slide()

	
func move():
	if Input.is_action_just_pressed("dash") && state_machine.can_dash_check():
		is_dashing = true
		
		dash_cooldown.start()
		state_machine.current_state.next_state = dash_state
	
	var direction = Input.get_axis("left", "right")
	if direction !=0 && state_machine.can_move_check():
		if is_dashing:
			velocity.x = direction * dash_speed
		else:
			velocity.x = direction * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)

func apply_gravity():
		velocity.y += gravity


	 
		

func _on_dash_cd_timeout():
	is_dashing = false


func _on_left_hit_box_body_entered(body):
	if body.is_in_group("hit"):
		body.take_damage()
	else:
		pass


func _on_right_hit_box_body_entered(body):
	if body.is_in_group("hit"):
		body.take_damage()
	else:
		pass
