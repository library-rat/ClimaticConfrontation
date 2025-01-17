extends Intervention

var devotion_increase = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	type = Enums.ElementType.FIRE
	cost = 30
	description.text = "Increase devotion by %s" % devotion_increase


# Called every frame. 'delta' is the elapsed time since the previous frame.
func act():
	if ( ! check_element(type, cost)) :
		return
	god.add_devotion(devotion_increase)
	super.act()
