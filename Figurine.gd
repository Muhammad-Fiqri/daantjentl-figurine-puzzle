extends CharacterBody2D


const SPEED = 30000.0

func _physics_process(delta):
	if is_clicked and global_position.distance_to(get_global_mouse_position()) > 10:
		follow_mouse(delta)
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()

func _on_input_event(viewport, event, shape_idx):
	check_if_clicked(event)

func _input(event):
	check_if_click_released(event)

var is_clicked = false

func check_if_clicked(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_clicked = true
			print(is_clicked)

func check_if_click_released(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			is_clicked = false
			print(is_clicked)

func follow_mouse(delta):
	var direction_to_mouse = global_position.direction_to(get_global_mouse_position())
	velocity = direction_to_mouse * SPEED * delta
