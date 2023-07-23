extends Node2D
func  _ready():
	$AnimationPlayer.play("Slam")
func enemyHit(area: Area2D):
	Globals.kills -= 1
	area.get_parent().death()

