extends Node

var hp := 100.0
var score := 0.0
var timer = 0.0

func _ready() -> void:
	add_child(load("res://gui/gui.tscn").instantiate())

func _process(delta: float) -> void:
	timer += delta
	var min = int(timer / 60)
	var sec = int(timer) % 60
	$Gui/TimerLabel.text = "%d:%02d" % [min, sec]
	
	if Input.is_action_just_pressed("reset"):
		reset()

func reset():
	timer = 0.0
	hp = 100.0
	score = 0
	player_got_hit(0) # refresh
	enemy_died(0) # refresh
	get_tree().reload_current_scene() 

func player_got_hit(damage:float) -> void:
	hp -= damage
	$Gui/HpLabel.text = "HP: " + str(hp)


func enemy_died(points:float) -> void:
	score += points
	$Gui/ScoreLabel.text = "Score: " + str(score)
