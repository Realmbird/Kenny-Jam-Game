extends Node2D
func  _ready():
	$AnimationPlayer.play("Shoot")
func enemyHit(area: Area2D):
	area.get_parent().death()

