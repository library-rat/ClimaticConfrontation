extends Intervention
class_name Blaze


func _ready() -> void:
	type = Enums.ElementType.MIGHT
	cost = 70
	description.text = "Reduce Global Wild by 30% and increase Personal Fire by twice the amount"

func act():
	if (!check_element(type, cost)) :
		return
	#var wildvalue : float = god.get_global_elements(Enums.ElementType.WILD)
	#print("Initial wildfire %f" % god.get_global_elements(Enums.ElementType.WILD))
	#god.add_element(Enums.ElementType.FIRE, wildvalue*0.7 * 2)
	#god.multiply_global_element(Enums.ElementType.WILD, 0.7)
	#print("After wildfire %f" % god.get_global_elements(Enums.ElementType.WILD))

	super.act()
	
