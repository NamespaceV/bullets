class_name Enemy
extends RigidBody2D

@export var speed := 400.0

func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	var dir = Vector2(-1,0)
	dir.y = sin(Time.get_unix_time_from_system()*5)
	move_and_collide(dir*speed*delta)
