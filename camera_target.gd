extends Node2D

@export var Zoom_Level : float
@export var Camera : Camera2D
var Zoom_Level_Vector : Vector2

func _ready():
	Zoom_Level_Vector = Vector2(Zoom_Level,Zoom_Level)

func activate():
	Camera.update_target(self,Zoom_Level_Vector)
