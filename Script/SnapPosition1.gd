extends Marker2D

var neighbour = []
var occupied = false
var color = "red"
@onready var snap_position_7 = get_parent().get_node("SnapPosition7")
@onready var snap_position_2 = get_parent().get_node("SnapPosition2")
@onready var UI = %UI

# Called when the node enters the scene tree for the first time.
func _ready():
	neighbour.append(snap_position_7)
	neighbour.append(snap_position_2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child_count() >= 2:
		occupied = true
		check_if_correct_pos()
	else:
		occupied = false
		UI.red_correct = false

func check_if_correct_pos():
	var figurine = find_child("Figurine*",true,false)
	if find_child("Figurine*") != null:
		if figurine.color == color:
			UI.red_correct = true
		else:
			UI.red_correct = false
	else:
		UI.red_correct = false
