extends Node

class_name EnemyState

func enter():
	set_physics_process(true)
		
func exit():
	set_physics_process(false)
		
func transition():
	pass
	
func _physics_process(delta):
	transition()
	
