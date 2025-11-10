extends ElementManager

class_name GlobalRessources

@onready var gods : Array[God] = [$HBoxContainer/BasicGod,$HBoxContainer/BasicGod2]

@onready var stopButton : Button = $HBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer/StopButton
@onready var playButton : Button = $HBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer/PlayButton
@onready var fastButton : Button = $HBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer/FastButton

@onready var SeasonWheel : Control = $HBoxContainer/VBoxContainer2/Season_Wheel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	elements_label.insert(Enums.ElementType.ABUNDANCE,$HBoxContainer/VBoxContainer2/VBoxContainer/Abundance/Label)
	elements_label.insert(Enums.ElementType.DEVASTATION,$HBoxContainer/VBoxContainer2/VBoxContainer/Devastation/Label)
	elements_label.insert(Enums.ElementType.MALICE,$HBoxContainer/VBoxContainer2/VBoxContainer/Malice/Label)
	elements_label.insert(Enums.ElementType.MIGHT,$HBoxContainer/VBoxContainer2/VBoxContainer/Might/Label)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _set_devotion(value : int) -> void :
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
