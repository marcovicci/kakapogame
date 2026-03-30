# "Extends" means it has all the capabilities of 
# an existing class of object.
extends Button

# "Exported" variables are the ones you can edit in the Inspector 
# without touching the code!
@export var Camera_Target : Node2D
# Defining the Camera_Target object that clicking this button will snap to

func _on_button_down():
	Camera_Target.activate()
	print(Camera_Target)
