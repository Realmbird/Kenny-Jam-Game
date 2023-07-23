extends CanvasLayer

func _process(delta):
	updateLabel(Globals.kills)
func updateLabel(kills):
	$Label.text = "Bodies: " + str(kills)
