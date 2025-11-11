extends Node2D

var built = false

var on_expedition = false
var moving_right = false
var moving_left = false
var start_x

const DISTANCE = 800
const SPEED = 40


signal ship_returned() 

func _ready():
	start_x = position.x
	play_animation()

func _process(delta):
	if built:
		move(delta)
	play_animation()


func get_built():
	built = true

func play_animation():
	var anim = $AnimatedSprite2D
	if not built:
		anim.play("lot")
	else:
		if  moving_right:
			anim.flip_h = true
		elif moving_left:
			anim.flip_h = false
		anim.play("default")

func move(delta):
	if moving_right:
		position.x = position.x + SPEED * delta
		if position.x >= (start_x + DISTANCE):
			moving_right = false
			$Wait.start(0)
	elif moving_left:
		position.x = position.x - SPEED * delta
		if position.x <= start_x:
			position.x = start_x
			moving_left = false
			end_expidition()
			

func end_expidition():
	emit_signal("ship_returned")   
	on_expedition = false

func start_expedition():
	on_expedition = true
	moving_right = true

func _on_timer_timeout() -> void:
	moving_left = true
	$Wait.stop()
