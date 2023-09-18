extends Area2D

signal hit

@export var _speed : int = 400

var _screen_size

func _ready():
	_screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	var velocity = Vector2.ZERO
	
	## grab the input
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	## flip the sprite horizontally when moving
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	if velocity.y != 0:
		$AnimatedSprite2D.flip_v = velocity.y > 0
	
	## calculate speed and animate movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * _speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	## apply the movement
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, _screen_size)

## start the player scene given a position
func start(pos: Vector2):
	position = pos
	show()
	$CollisionShape2D.set_deferred("disabled", false)

func _on_body_entered(_body):
	hide()
	hit.emit()
	
	$CollisionShape2D.set_deferred("disabled", true)
