extends Sprite2D

@onready var viewportWidth = get_tree().root.size.x
@onready var viewportHeight = get_tree().root.size.y

@onready var assetScale = viewportWidth / self.texture.get_size().x

func _ready() -> void:
	self.set_position(Vector2(viewportWidth/2, viewportHeight/2))
	self.set_scale(Vector2(assetScale, assetScale))
	get_tree().get_root().size_changed.connect(updateSize)

func updateSize():
	viewportWidth = get_tree().root.size.x
	viewportHeight = get_tree().root.size.y
	assetScale = viewportWidth / self.texture.get_size().x
	self.set_position(Vector2(viewportWidth/2, viewportHeight/2))
	self.set_scale(Vector2(assetScale, assetScale))
