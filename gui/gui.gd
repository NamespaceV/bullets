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

func player_got_hit(damage:float) -> void:
	hp -= damage
	$Gui/HpLabel.text = "HP: " + str(hp)


func enemy_died(points:float) -> void:
	score += points
	$Gui/ScoreLabel.text = "Score: " + str(score)
