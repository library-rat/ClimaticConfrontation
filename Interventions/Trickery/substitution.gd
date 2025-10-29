extends Intervention
class_name Substitution


func _ready() -> void:
	#type = Enums.ElementType.TRICKERY
	cost = 150
	description.text = "Exchange personal elements between the gods"

func act():
	if (!check_element(type, cost)) :
		return
	super.act()
	var temp :Array[float] = god.elements
	god.elements = god.otherGod.elements
	god.otherGod.elements = temp
	god.otherGod.update_values()
	god.update_values()
