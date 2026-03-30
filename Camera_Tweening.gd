extends Camera2D

@export var Camera_Target : Vector2
@export var Lerp_Speed : float
@export var Zoom_Level : Vector2

func _process(delta):
	if (self.position != Camera_Target):
		self.position = self.position.lerp(Camera_Target, Lerp_Speed)
	if (self.zoom != Zoom_Level):
		self.zoom = self.zoom.lerp(Zoom_Level, Lerp_Speed)

func update_target(node, zoomlevel):
	Camera_Target = node.position
	Zoom_Level = zoomlevel
