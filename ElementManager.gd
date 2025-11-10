@abstract
class_name ElementManager extends Control

@export var elements : Array[int] = [0,0,0,0]
@export var elements_label : Array[Control]
@export var min_value : Array[int] = [0,0,0,0]

@export var devotion : int = 50 : set = _set_devotion

func add_element(type : Enums.ElementType, value : int)->void:
	elements[type] += value
	update_values()

func remove_element(type : Enums.ElementType, value : int)->void:
	elements[type] = max(elements[type] - value, min_value[type])
	update_values()

func set_elements(new_elements : Array[int]):
	for type in Enums.ElementType.values() :
		elements[type] = new_elements[type]
	update_values()

func get_elements(type : Enums.ElementType) -> int:
	return(elements[type])

func check_element(type : Enums.ElementType, value : int)->bool:
	return elements[type] >= value

func _set_devotion(value : int) -> void :
	devotion = value

func update_values() -> void :
	for type in Enums.ElementType.values() :
		elements_label[type].text = str(elements[type]).pad_decimals(0)
	
