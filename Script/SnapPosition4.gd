extends Marker2D

var neighbour = []
var occupied = false
var color = "green"
@onready var snap_position_3 = get_parent().get_node("SnapPosition3")
@onready var snap_position_5 = get_parent().get_node("SnapPosition5")
@onready var UI = %UI

# Called when the node enters the scene tree for the first time.
func _ready():
	neighbour.append(snap_position_3)
	neighbour.append(snap_position_5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child_count() >= 2:
		occupied = true
		check_if_correct_pos()
	else:
		occupied = false
		UI.green_correct = false

func check_if_correct_pos():
	var figurine = find_child("Figurine*",true,false)
	if find_child("Figurine*") != null:
		if figurine.color == color:
			UI.green_correct = true
		else:
			UI.green_correct = false
	else:
		UI.green_correct = false
