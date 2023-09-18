extends RigidBody2D

func _ready():
	## play the default animation
	$AnimatedSprite2D.play("walk")

## deletes the mob when exiting the screen
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
