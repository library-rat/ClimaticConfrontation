extends Control

class_name GlobalRessources

var elements : Array[float] = [0,0,0,0]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_ressource(type : Enums.ElementType, value : int)->void:
	elements[type] += value

func removre_ressource(type : Enums.ElementType, value : int)->void:
	elements[type] -= value
