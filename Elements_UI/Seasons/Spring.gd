extends BaseSeason
class_name Spring

func seasonEffect(ressources :GlobalRessources) -> void :
	ressources.add_ressource(Enums.ElementType.WILD, 1)
