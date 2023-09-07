extends Node2D

@onready var starting_snap_pos_group = [$SnapPosition1,$SnapPosition2,$SnapPosition3,$SnapPosition4,$SnapPosition6,$SnapPosition7]
@onready var figurine_group = [$%FigurineRed,$%FigurineYellow,$%FigurineGreen,$"%FigurineBlue",$"%FigurinePurple",$"%FigurineBlack"]
@onready var starting_position = {
	$SnapPosition1 : null,
	$SnapPosition2 : null,
	$SnapPosition3 : null,
	$SnapPosition4 : null,
	$SnapPosition6 : null,
	$SnapPosition7 : null,
}

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
	
	save_start_position()

func save_start_position():
	var starting_snap = [$SnapPosition1,$SnapPosition2,$SnapPosition3,$SnapPosition4,$SnapPosition6,$SnapPosition7]
	for i in starting_snap:
		var figurine = i.find_child("Figurine*",true,false)
		starting_position[i] = figurine

func _on_reset_button_button_down():
	for i in starting_position:
		var position = i
		var figurine = starting_position[i]
		figurine.reparent(position)
		figurine.owner = position
		figurine.global_position = position.global_position
