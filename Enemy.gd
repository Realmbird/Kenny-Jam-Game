extends Node2D
func _physics_process(delta):
	var player = get_parent().get_node("Player")
	position += (player.position - position).normalized() * 0.7
	

func _on_Hitbox_area_entered(area):
	pass # Replace with function body.
