# "Extends" means it has all the capabilities of an existing class of object.
extends CharacterBody2D

@export var speed = 1000
@export var Player_Target : Vector2
@export var Min_Distance = 10.0

# default value higher than our current number of kakapo
var target = 666;

func _ready():
	Player_Target = self.position

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	if Input.is_action_just_pressed('target'):
		target_kakapo()
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	if (self.position.distance_to(Player_Target) > Min_Distance):
		velocity = position.direction_to(Player_Target) * speed
	else: 
		velocity = Vector2(0,0)
	#get_input()
	move_and_slide()
	
func update_target(node):
	Player_Target = node
	
func target_kakapo():
	var kakapo_list = get_tree().get_nodes_in_group('kakapo')
	target += 1
	if target >= kakapo_list.size():
		target = 0;
	kakapo_list[target].target_kakapo()
	kakapo_list[target-1].untarget_kakapo()
		
