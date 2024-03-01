extends CharacterBody2D
class_name EnemyController

signal damaged 


	
@export var gravity: float = 30 
@export var state_machine: EnemyStateMachine
@export var detect_player: RayCast2D
@export var patrol_points: PatrolPoints


func take_damage():
	damaged.emit()
	
func 
