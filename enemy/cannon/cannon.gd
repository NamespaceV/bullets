extends Marker2D

@export var cooldown = 0.5
var timer := 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	timer += delta
	if timer > cooldown:
		timer -= cooldown
		Bullet.create_for_enemy(self)
	pass
