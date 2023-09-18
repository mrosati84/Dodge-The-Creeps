extends Node2D

@export var mob_scene : PackedScene

var score

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_mob_timer_timeout():
	pass # Replace with function body.

func _on_score_timer_timeout():
	score += 1
	print(score)

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
