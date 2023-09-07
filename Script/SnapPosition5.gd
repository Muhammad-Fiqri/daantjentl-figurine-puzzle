extends Marker2D

var neighbour = []
var occupied = false
var color = "none"
@onready var snap_position_2 = get_parent().get_node("SnapPosition2")
@onready var snap_position_3 = get_parent().get_node("SnapPosition3")
@onready var snap_position_4 = get_parent().get_node("SnapPosition4")
@onready var snap_position_6 = get_parent().get_node("SnapPosition6")
@onready var snap_position_7 = get_parent().get_node("SnapPosition7")

# Called when the node enters the scene tree for the first time.
func _ready():
	neighbour.append(snap_position_2)
	neighbour.append(snap_position_3)
	neighbour.append(snap_position_4)
	neighbour.append(snap_position_6)
	neighbour.append(snap_position_7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child_count() >= 1:
		occupied = true
	else:
		occupied = false
