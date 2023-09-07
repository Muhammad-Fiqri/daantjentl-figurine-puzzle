extends Control

var correct_position = 0
var red_correct = false
var blue_correct = false
var yellow_correct = false
var green_correct = false
var purple_correct = false
var black_correct = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var correct_array = [red_correct,blue_correct,yellow_correct,green_correct,purple_correct,black_correct]
	for i in correct_array:
		if i == true:
			correct_position += 1
	$CorrectPos.text = "Correct Position: "+ str(correct_position)
	if correct_position == 6:
		$"%Solved".visible = true
	else:
		$"%Solved".visible = false
	correct_position = 0

