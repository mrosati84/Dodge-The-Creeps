extends Area2D

@export var speed : float = 400.0
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	pass

func _physics_process(delta):
	pass
