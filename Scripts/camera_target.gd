# "Extends" means it has all the capabilities of 
# an existing class of object.
extends Node2D

# "Exported" variables are the ones you can edit in the Inspector 
# without touching the code!
@export var Zoom_Level : float = 0.05
@export var Camera : Camera2D
@export var Player : CharacterBody2D
@export var Player_Target_Position : Vector2
var Zoom_Level_Vector : Vector2

# "Ready" functions run as the scene loads
func _ready():
	Zoom_Level_Vector = Vector2(Zoom_Level,Zoom_Level)

# This function updates the camera's target with this object's location
# and the set zoom level
func activate():
	Camera.update_target(self,Zoom_Level_Vector)
	Player.update_target(Player_Target_Position)
