class_name Enemy
extends Area2D

@export var speed := 200.0

@export var sin_speed_pct := 2
@export var sin_period := 1

func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	var dir = Vector2(-1,0)
	dir.y = sin_speed_pct * sin(Time.get_unix_time_from_system() * 2 * PI / sin_period)
	position += dir*speed*delta


func hit_by_bullet(b : Bullet) -> void:
	b.queue_free()
	queue_free()
	GUI.enemy_died(10)


func _on_body_entered(body: Node2D) -> void:
	if (body as Player):
		(body as Player).hit_by_enemy(self)
