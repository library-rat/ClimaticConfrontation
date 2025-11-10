extends ElementManager

class_name God 

@onready var InterventionContainer = $VBoxContainer/GridContainer
@export var globalRessources : GlobalRessources
@export var otherGod : God

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in InterventionContainer.get_children() :
		child.god = self 
	elements_label.insert(Enums.ElementType.ABUNDANCE,$VBoxContainer/HBoxContainer/VBoxContainer/Abundance/Label)
	elements_label.insert(Enums.ElementType.DEVASTATION,$VBoxContainer/HBoxContainer/VBoxContainer/Devastation/Label)
	elements_label.insert(Enums.ElementType.MALICE,$VBoxContainer/HBoxContainer/VBoxContainer/Malice/Label)
	elements_label.insert(Enums.ElementType.MIGHT,$VBoxContainer/HBoxContainer/VBoxContainer/Might/Label)
	devotion_label = $VBoxContainer/HBoxContainer/VBoxContainer/Devotion

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func remove_ressource(type : Enums.ElementType, value : int)->void:
	elements[type] = max(elements[type] - value, 0)
	update_values()

func get_elements(type : Enums.ElementType) -> int:
	return elements[type] + globalRessources.elements[type]

func get_global_elements(type : Enums.ElementType) -> int :
	return globalRessources.elements[type]

func remove_element(type :Enums.ElementType, value : int):
	var value_left = value - globalRessources.elements[type]
	if value_left > 0 :
		elements[type] = elements[type] - value_left
	update_values()

func remove_global_element(type : Enums.ElementType, value : float):
	globalRessources.elements[type] = max(0, globalRessources.elements[type] - value)
	globalRessources.update_values()

func add_element(type :Enums.ElementType, value : int):
	elements[type] = elements[type] + value
	print("valeur de l'ajout %f" % value)
	print("valeur de l'élément %f" % elements[type])
	
func add_global_element(type :Enums.ElementType, value : int):
	globalRessources.elements[type] = globalRessources.elements[type] + value

func multiply_element(type :Enums.ElementType, value : int) -> void :
	elements[type] = elements[type]*value
	update_values()

func multiply_global_element(type :Enums.ElementType, value : int) -> void :
	globalRessources.elements[type] = globalRessources.elements[type]*value
	globalRessources.update_values()
