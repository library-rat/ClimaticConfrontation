extends BaseSeason

class_name Winter

func seasonEffect(ressources :GlobalRessources) -> void :
	ressources.add_ressource(Enums.ElementType.ICE, 1)
	ressources.add_ressource(Enums.ElementType.TRICKERY, 0.3)
