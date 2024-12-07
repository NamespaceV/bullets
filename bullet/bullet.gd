class_name Bullet
extends Area2D

@export var speed := 600.0
static var bullet_scene = load("res://bullet/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var fwd = global_transform.basis_xform(Vector2(0,-1)) 
	position += (fwd*speed*delta)
	
	var offset = 100
	var screen = get_viewport().get_visible_rect().size
	if position.x < -offset or position.x > screen.x + offset \
	 or position.y < -offset or position.y > screen.y + offset:
		print("bullet remove", position, "outside", get_viewport().size)

		queue_free()
	

static func create_for_player (pl : Player) -> Bullet:
	var b: Bullet = bullet_scene.instantiate()
	b.position = pl.position
	b.rotation_degrees = 90
	Engine.get_main_loop().get_root().add_child(b)
	return b

static func create_for_enemy(enemy_cannon:Node2D) -> Bullet:
	var b: Bullet = bullet_scene.instantiate()
	(b.get_node("Polygon2D") as Polygon2D).color = Color.CRIMSON
	b.position = enemy_cannon.global_position
	b.rotation = enemy_cannon.global_rotation
	Engine.get_main_loop().get_root().add_child(b)
	return b
	
	
