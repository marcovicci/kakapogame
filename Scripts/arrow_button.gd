extends Button

@export var Camera_Target : Node2D

func _on_button_down():
	Camera_Target.activate()
	print(Camera_Target)
