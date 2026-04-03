# "Extends" means it has all the capabilities of 
# an existing class of object.
extends Camera2D

# "Exported" variables are the ones you can edit in the Inspector 
# without touching the code!
@export var Camera_Target : Vector2
@export var Lerp_Speed : float = 0.01
@export var Zoom_Level : Vector2 = Vector2(0.5,0.5)

# the "Process" function runs repeatedl		print(self.position.distance_to(Player_Target))y, each 'tick' of the game
func _process(delta):
	if (self.position != Camera_Target):
		self.position = self.position.lerp(Camera_Target, Lerp_Speed)
	if (self.zoom != Zoom_Level):
		self.zoom = self.zoom.lerp(Zoom_Level, Lerp_Speed)

func update_target(node, zoomlevel):
	Camera_Target = node.position
	Zoom_Level = zoomlevel
