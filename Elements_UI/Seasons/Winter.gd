extends BaseSeason

class_name Winter

func seasonEffect(ressources :GlobalRessources) -> void :
	ressources.add_ressource(Enums.ElementType.ICE, 1)
	ressources.add_ressource(Enums.ElementType.TRICKERY, 0.5)
	ressources.remove_ressource(Enums.ElementType.WILD, 1)
	ressources.remove_ressource(Enums.ElementType.FIRE, 1)
