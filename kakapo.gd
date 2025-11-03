extends CharacterBody2D

var destination : Vector2
var moving := false

@export_category("Stats") 
@export var movement_speed := 20000000.0 

@export_category("Nodes")
@export var region : NavigationRegion2D ## reference to NavigationRegion2D enemy should walk by default
@export var navigation_agent : NavigationAgent2D ## reference to NavigationAgent2D
@export var sprite : Sprite2D ## sprite
@export var target : Polygon2D

const MIN_WAIT := 1.0 ## minimum wait time for movement delay
const MAX_WAIT := 3.0 ## maximum wait time for movement delay

func _ready() -> void:
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	
func set_movement_target(movement_target: Vector2):
	navigation_agent.set_target_position(movement_target)

func _physics_process(delta):
	if not moving: # if enemy is not moving, pick a new destination
		destination = (NavigationServer2D.region_get_random_point(region.get_rid(), 1, false)) # get a random point from NavigationRegion2D
		moving = true
		navigation_agent.target_position = destination # sets the destination as a target position for NavigationAgent2D
		navigation_agent.set_target_position(destination)
	
	# Do not query when the map has never synchronized and is empty.
	if NavigationServer2D.map_get_iteration_id(navigation_agent.get_navigation_map()) == 0:
		return
	if navigation_agent.is_navigation_finished():
		return
	if moving: # if enemy has target position set and is ready to start moving
		
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()
		var direction = (self.global_position - next_path_position).normalized() # calculates the direction vector towards the destination
		if direction.x <= 0:
			sprite.flip_h = true # or false
		else: 
			sprite.flip_h = false # or false
		var new_velocity: Vector2 = -direction * movement_speed * delta # sets the velocity
		if navigation_agent.avoidance_enabled:
			navigation_agent.set_velocity(new_velocity)
		else:
			_on_velocity_computed(new_velocity)

func _on_velocity_computed(safe_velocity: Vector2):
	velocity = safe_velocity
	move_and_slide()
	if navigation_agent.distance_to_target() < 50.0: # checks if NavigationAgent2D distance towards the target position is less then 50 pixels
			moving = false # sets the moving variable to false, so it can pick a new destination

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "Dog" || collision.get_collider().name == "Moose":
			moving = false #force a movement recalculation

func target_kakapo():
	target.visible = true;
	
func untarget_kakapo():
	target.visible = false;
