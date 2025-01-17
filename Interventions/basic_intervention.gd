extends Control
class_name Intervention

@export var type : Enums.ElementType
@export var cost : int
var god : God
@onready var description :RichTextLabel = $Description/RichTextLabel

func act():
	if check_element(type,cost):
		remove_element(type,cost)


func _on_button_mouse_entered() -> void:
	$DescriptionTimer.start(0.7)


func _on_button_mouse_exited() -> void:
	$Description.visible = false
	$DescriptionTimer.stop()


func _on_description_timer_timeout() -> void:
	$Description.visible = true

func check_element(type :Enums.ElementType, value : int) -> bool:
	return god.check_element(type, value)

func remove_element(type :Enums.ElementType, value : int) -> void :
	god.remove_element(type,value)
	
func remove_global_element(type : Enums.ElementType, value : int) -> void:
	god.remove_global_element(type, value)

func multiply_element(type :Enums.ElementType, value : int) -> void :
	god.multiply_element(type,value)
	
func multiply_global_element(type :Enums.ElementType, value : int) -> void :
	god.multiply_global_element(type,value)

func _on_button_button_down() -> void:
	act()
