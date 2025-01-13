extends Control

class_name GlobalRessources

var elements : Array[float] = [0,0,0,0]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_ressource(type : Enums.ElementType, value : float)->void:
	elements[type] += value
	update_values()

func remove_ressource(type : Enums.ElementType, value : float)->void:
	elements[type] = max(elements[type] - value, 0)
	update_values()

func update_values() -> void :
	$VBoxContainer/Fire/Label.text = str(elements[Enums.ElementType.FIRE])
	$VBoxContainer/Ice/Label.text = str(elements[Enums.ElementType.ICE])
	$VBoxContainer/Trickery/Label.text = str(elements[Enums.ElementType.TRICKERY])
	$VBoxContainer/Wild/Label.text = str(elements[Enums.ElementType.WILD])
