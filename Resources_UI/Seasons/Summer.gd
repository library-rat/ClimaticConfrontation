extends BaseSeason

class_name Summer

func seasonEffect(ressources :GlobalRessources) -> void :
	ressources.add_ressource(Enums.ElementType.FIRE, 1)
