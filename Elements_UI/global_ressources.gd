extends Control

class_name GlobalRessources

@export var elements : Array[float] = [0,0,0,20]
@export var min_value : Array[float] = [0,0,0,10]

@export var devotion : float = 50. : set = _set_devotion


@onready var gods : Array[God] = [$BasicGod,$BasicGod2]

@onready var stopButton : Button = $VBoxContainer/HBoxContainer/StopButton
@onready var playButton : Button = $VBoxContainer/HBoxContainer/PlayButton
@onready var fastButton : Button = $VBoxContainer/HBoxContainer/FastButton

@onready var SeasonWheel : Control = $Season_Wheel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_ressource(type : Enums.ElementType, value : float)->void:
	elements[type] += value
	update_values()

func remove_ressource(type : Enums.ElementType, value : float)->void:
	elements[type] = max(elements[type] - value, min_value[type])
	update_values()

func check_element(type : Enums.ElementType, value : float)->bool:
	return elements[type] >= value

func _set_devotion(value : float) -> void :
	if devotion >= 100 :
		print("left win")
	elif devotion <= 0 :
		print("right win")
	devotion = value

func add_devotion(value : float, target : God) -> void :
	var coef : int = 0
	if (gods[0] == target) :
		coef = 1
	elif  (gods[1] == target) :
		coef = -1
	devotion += value * coef

func remove_devotion(value: float, target : God) -> void :
	var coef : int = 0
	if (gods[0] == target) :
		coef = 1
	elif  (gods[1] == target) :
		coef = -1
	devotion -= value * coef

func update_values() -> void :
	$VBoxContainer/Fire/Label.text = str(elements[Enums.ElementType.FIRE]).pad_decimals(0)
	$VBoxContainer/Ice/Label.text = str(elements[Enums.ElementType.ICE]).pad_decimals(0)
	$VBoxContainer/Trickery/Label.text = str(elements[Enums.ElementType.TRICKERY]).pad_decimals(0)
	$VBoxContainer/Wild/Label.text = str(elements[Enums.ElementType.WILD]).pad_decimals(0)


func _on_stop_button_pressed() -> void:
	SeasonWheel.setSpeedStop()
	stopButton.disabled = true
	playButton.disabled = false
	fastButton.disabled = false

func _on_play_button_pressed() -> void:
	SeasonWheel.setSpeedPlay()
	stopButton.disabled = false
	playButton.disabled = true
	fastButton.disabled = false

func _on_fast_button_pressed() -> void:
	SeasonWheel.setSpeedFast()
	stopButton.disabled = false
	playButton.disabled = false
	fastButton.disabled = true
