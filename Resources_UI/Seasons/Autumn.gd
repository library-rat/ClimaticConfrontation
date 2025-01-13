extends BaseSeason

class_name Autumn

func seasonEffect(ressources :GlobalRessources) -> void :
	ressources.add_ressource(Enums.ElementType.TRICKERY, 1)
