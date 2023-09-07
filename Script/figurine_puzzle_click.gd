extends Node2D

@onready var starting_snap_pos_group = [$SnapPosition1,$SnapPosition2,$SnapPosition3,$SnapPosition4,$SnapPosition6,$SnapPosition7]
@onready var figurine_group = [$%FigurineRed,$%FigurineYellow,$%FigurineGreen,$"%FigurineBlue",$"%FigurinePurple",$"%FigurineBlack"]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize_figurine_location()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func randomize_figurine_location():
	for i in figurine_group:
		var position_chosen = randi_range(0,starting_snap_pos_group.size() - 1)
		i.reparent(starting_snap_pos_group[position_chosen])
		i.owner = starting_snap_pos_group[position_chosen]
		i.global_position = starting_snap_pos_group[position_chosen].global_position
		starting_snap_pos_group.pop_at(position_chosen)
