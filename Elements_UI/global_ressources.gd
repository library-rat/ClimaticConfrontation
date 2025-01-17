extends Control

class_name GlobalRessources

var elements : Array[float] = [0,0,0,20]
var min_value : Array[float] = [0,0,0,10]

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
	elements[type] = max(elements[type] - value, min_value[type])
	update_values()

func check_element(type : Enums.ElementType, value : float)->bool:
	return elements[type] >= value

func update_values() -> void :
	$VBoxContainer/Fire/Label.text = str(elements[Enums.ElementType.FIRE]).pad_decimals(0)
	$VBoxContainer/Ice/Label.text = str(elements[Enums.ElementType.ICE]).pad_decimals(0)
	$VBoxContainer/Trickery/Label.text = str(elements[Enums.ElementType.TRICKERY]).pad_decimals(0)
	$VBoxContainer/Wild/Label.text = str(elements[Enums.ElementType.WILD]).pad_decimals(0)
