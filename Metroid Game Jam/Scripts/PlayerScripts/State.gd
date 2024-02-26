extends Node
class_name State

var player: CharacterBody2D
var next_state: State

@export var can_dash: bool = true
@export var can_move: bool = true



func enter():
	pass
	
func exit():
	pass
	
func state_input(event: InputEvent):
	pass
	
func state_process(_delta):
	pass
