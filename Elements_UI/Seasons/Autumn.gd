extends BaseSeason

class_name Autumn

func seasonEffect(ressources :GlobalRessources) -> void :
	ressources.add_ressource(Enums.ElementType.TRICKERY, 0.4)
	ressources.add_ressource(Enums.ElementType.ICE, 0.2)
	ressources.remove_ressource(Enums.ElementType.WILD,0.3)
	ressources.remove_ressource(Enums.ElementType.FIRE,3)
	
