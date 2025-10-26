extends Resource

class_name BaseMonth

@export var duration : int = 30
@export var elements : Array[float] = [0,0,0,20]

var modifiers : Array[MonthModifier]

func startMonth():
	pass

func monthEffect(ressources :GlobalRessources) -> void :
	pass

func endMonth():
	pass

func getElements() -> Array[float] :
	return elements
