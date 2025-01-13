extends Control

@export var type : Enums.ElementType
@export var cost : int


func act():
	pass


func _on_button_mouse_entered() -> void:
	$DescriptionTimer.start(0.7)


func _on_button_mouse_exited() -> void:
	$Description.visible = false
	$DescriptionTimer.stop()


func _on_description_timer_timeout() -> void:
	$Description.visible = true
