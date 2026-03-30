# "Extends" means it has all the capabilities of an existing class of object.
extends Node2D

var mouseY;
var whistling;
var this_whistle;
var last_whistle;

var timer: Timer = Timer.new()

func _init():
	print("Whistle is listening");
	whistling = false;
	add_child(timer);
	timer.wait_time = 0.5; # How long we're waiting
	timer.one_shot = false; # trigger once or multiple times
	timer.timeout.connect(_whistle_timer);
	
func _process(_delta):
	if Input.is_action_pressed("whistle"):
		if whistling == false:
			print("Starting whistle");
			whistling = true;
			mouseY = get_global_mouse_position().y;
			timer.start();
	else:
		if whistling == true:
			whistling = false;
			print("Whistle stopped");

func _whistle_timer():
	if whistling == true:
		if get_global_mouse_position().y > mouseY:
				var mouseDif = get_global_mouse_position().y - mouseY;
				if (mouseDif > 20):
					this_whistle = "DOWN";
					_whistle_handler();
				else:
					this_whistle = "MID";
					_whistle_handler();
		elif get_global_mouse_position().y < mouseY:
				var mouseDif = mouseY - get_global_mouse_position().y;
				if (mouseDif > 20):
					this_whistle = "UP";
					_whistle_handler();
				else:
					this_whistle = "MID";
					_whistle_handler();
		timer.start();

func _whistle_handler():
	if this_whistle == "UP":
		# check against last whistle
		if last_whistle == this_whistle:
			print("Whistle steady-up");
		elif last_whistle == "MID":
			print("Whistle mid-up");
		elif last_whistle == "DOWN":
			print("Whistle down-up");
	elif this_whistle == "MID":
		# check against last whistle
		if last_whistle == this_whistle:
			print("Whistle steady-mid");
		elif last_whistle == "UP":
			print("Whistle up-mid");
		elif last_whistle == "DOWN":
			print("Whistle down-mid");
	elif this_whistle == "DOWN":
		# check against last whistle
		if last_whistle == this_whistle:
			print("Whistle steady-down");
		elif last_whistle == "UP":
			print("Whistle up-down");
		elif last_whistle == "MID":
			print("Whistle mid-down");
	last_whistle = this_whistle;
