extends Camera2D

@export var SPEED: float = 20.0
@export var ZOOM_SPEED: float = 30.0
@export var ZOOM_MIN: float = 0.5
@export var ZOOM_MAX: float = 2.0

var zoomFactor: float = 0.85
var zoomPos: Vector2 = Vector2()
var zooming: bool = false

var mousePos: Vector2 = Vector2()
var mousePosGlobal: Vector2 = Vector2()

const POS_START: Vector2 = Vector2(1600,750)
const POS_MIN: Vector2 = Vector2(0,0)
const POS_MAX: Vector2 = Vector2(2300,1600)
const POS_OFFSET: Vector2 = Vector2(320,180)

func _ready():
	position.x = POS_START.x
	position.y = POS_START.y


func _process(delta):
	zoom_camera(delta)
	move_camera(delta)


func zoom_camera(delta: float) -> void:
	zoom.x = lerp(zoom.x, zoom.x * zoomFactor, ZOOM_SPEED * delta)
	zoom.y = lerp(zoom.y, zoom.y * zoomFactor, ZOOM_SPEED * delta)
	
	zoom.x = clamp(zoom.x, ZOOM_MIN, ZOOM_MAX)
	zoom.y = clamp(zoom.y, ZOOM_MIN, ZOOM_MAX)
	if not zooming:
		zoomFactor = 1.0

func move_camera(delta: float) -> void:
	var inputX: int = get_input_x()
	var inputY: int = get_input_y()
	## moves faster for less zoom
	position.x = lerp(position.x, position.x + inputX * SPEED * zoom.x, (1/zoom.x) * SPEED * delta)
	position.y = lerp(position.y, position.y + inputY * SPEED * zoom.y, (1/zoom.y) * SPEED * delta)
	
	position.x = clamp(position.x,POS_MIN.x+POS_OFFSET.x*(1/zoom.x),POS_MAX.x-POS_OFFSET.x*(1/zoom.x))
	position.y = clamp(position.y,POS_MIN.y+POS_OFFSET.y*(1/zoom.y),POS_MAX.y-POS_OFFSET.y*(1/zoom.y))


func get_input_x() -> int:
	return int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	

func get_input_y() -> int:
	return int(Input.is_action_pressed("Down")) - int(Input.is_action_pressed("Up"))



func _input(event: InputEvent) -> void:
	input_for_zoom(event)
	
	if event is InputEventMouse:
		mousePos = event.position
		mousePosGlobal = get_global_mouse_position()


func input_for_zoom(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			zooming = true
			if event.is_action("WheelDown"):
				zoomFactor -= 0.01 * ZOOM_SPEED
				zoomPos = get_global_mouse_position()
			if event.is_action("WheelUp"):
				zoomFactor += 0.01 * ZOOM_SPEED
				zoomPos = get_global_mouse_position()
		else:
			zooming = false
