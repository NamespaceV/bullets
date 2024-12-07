class_name Player
extends RigidBody2D

@export var speed := 250.0

func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	move_and_collide(dir*delta*speed)
	if Input.is_action_just_pressed("shoot"):
		print("pew pew")
	pass
