extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var color = "black"

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			check_if_can_move()

func check_if_can_move():
	var snap_pos = get_parent()
	for i in snap_pos.neighbour:
		if i.occupied == false:
			reparent(i)
			owner = i
			global_position = i.global_position
