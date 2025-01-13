extends BaseSeason
class_name Spring

func seasonEffect(ressources :GlobalRessources) -> void :
	if ressources : 
		ressources.add_ressource(Enums.ElementType.WILD, 1)
		ressources.remove_ressource(Enums.ElementType.TRICKERY, 0.8)
		ressources.remove_ressource(Enums.ElementType.ICE,1)
