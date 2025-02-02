extends Control

class_name God

@export var elements : Array[float] = [0,0,0,0]
@onready var InterventionContainer = $VBoxContainer/GridContainer
@export var globalRessources : GlobalRessources
@export var otherGod : God

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in InterventionContainer.get_children() :
		child.god = self 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_ressource(type : Enums.ElementType, value : float)->void:
	elements[type] += value
	update_values()

func remove_ressource(type : Enums.ElementType, value : float)->void:
	elements[type] = max(elements[type] - value, 0)
	update_values()

func check_element(type : Enums.ElementType, value : float)-> bool :
	return globalRessources.check_element(type, value - elements[type])

func get_elements(type : Enums.ElementType) -> float:
	return elements[type] + globalRessources.elements[type]

func get_global_elements(type : Enums.ElementType) -> float :
	return globalRessources.elements[type]

func remove_element(type :Enums.ElementType, value : float):
	var value_left = value - globalRessources.elements[type]
	if value_left > 0 :
		elements[type] = elements[type] - value_left
	update_values()

func remove_global_element(type : Enums.ElementType, value : float):
	globalRessources.elements[type] = max(0, globalRessources.elements[type] - value)
	globalRessources.update_values()

func add_element(type :Enums.ElementType, value : float):
	elements[type] = elements[type] + value
	print("valeur de l'ajout %f" % value)
	print("valeur de l'élément %f" % elements[type])
	
func add_global_element(type :Enums.ElementType, value : float):
	globalRessources.elements[type] = globalRessources.elements[type] + value

func multiply_element(type :Enums.ElementType, value : float) -> void :
	elements[type] = elements[type]*value
	update_values()

func multiply_global_element(type :Enums.ElementType, value : float) -> void :
	globalRessources.elements[type] = globalRessources.elements[type]*value
	globalRessources.update_values()

func add_devotion(value : float) -> void :
	globalRessources.add_devotion(value, self)

func remove_devotion(value : float) -> void :
	globalRessources.remove_devotion(value, self)

func update_values() -> void :
	$VBoxContainer/HBoxContainer/VBoxContainer/Fire/Label.text = str(elements[Enums.ElementType.FIRE])
	$VBoxContainer/HBoxContainer/VBoxContainer/Ice/Label.text = str(elements[Enums.ElementType.ICE])
	$VBoxContainer/HBoxContainer/VBoxContainer/Trickery/Label.text = str(elements[Enums.ElementType.TRICKERY])
	$VBoxContainer/HBoxContainer/VBoxContainer/Wild/Label.text = str(elements[Enums.ElementType.WILD])
