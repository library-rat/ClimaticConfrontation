extends BaseSeason

class_name Summer

func seasonEffect(ressources :GlobalRessources) -> void :
	ressources.add_ressource(Enums.ElementType.FIRE, 1)
	ressources.add_ressource(Enums.ElementType.WILD, 0.5)
	ressources.remove_ressource(Enums.ElementType.ICE, 1)
