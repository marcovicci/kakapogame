extends CharacterBody2D

@export var speed = 200

# default value higher than our current number of kakapo
var target = 666;

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
	get_input()
	move_and_slide()

func target_kakapo():
	var kakapo_list = get_tree().get_nodes_in_group('kakapo')
	target += 1
	if target >= kakapo_list.size():
		target = 0;
	kakapo_list[target].target_kakapo()
	kakapo_list[target-1].untarget_kakapo()
		
