extends Area2D

@export var _speed : int = 400

var _screen_size

func _ready():
	_screen_size = get_viewport_rect().size

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
	
	## flip the sprite horizontally when moving left/right
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	## calculate speed and animate movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * _speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	## apply the movement
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, _screen_size)
