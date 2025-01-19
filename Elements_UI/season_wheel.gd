extends Control


@onready var timeCursor : Node = $Border/Cursor
@onready var wheelBorder : Node = $Border

@export var globalRessources : GlobalRessources
@export var radiusFactor :float = 1.4 *0.5
var day : int = 0
var maxDay : int = 360

var timeCounter : float = 0
@export var longDayDuration : float = 0.25
@export var shortDayDuration : float = 0.05
var currentDayDuration : float = longDayDuration

@onready var Season : Array[BaseSeason] = [Spring.new(),Summer.new(),Autumn.new(),Winter.new()]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if currentDayDuration < 0 :
		return
	timeCounter += delta

	if timeCounter >= currentDayDuration :
		timeCounter = 0.
		_on_new_day()


func _on_new_day() -> void:
	day =  (day +1)  % maxDay
	update_cursor_position()
	var counter : int = 0
	for i in range(Season.size()):
		if  (Season[i].duration + counter > day) :
			Season[i].seasonEffect(globalRessources)
			break
		counter += Season[i].duration


func update_cursor_position() ->void:
	var currentAngle = float(day)/maxDay * 2*PI
	timeCursor.position.x = wheelBorder.texture.get_size().x * -sin(currentAngle) * radiusFactor
	timeCursor.position.y = wheelBorder.texture.get_size().y * -cos(currentAngle) * radiusFactor
	timeCursor.rotation = -currentAngle

func setSpeedFast() -> void:
	currentDayDuration = shortDayDuration
func setSpeedPlay() -> void :
	currentDayDuration = longDayDuration
func setSpeedStop() -> void :
	currentDayDuration = -1
