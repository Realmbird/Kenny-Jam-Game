extends YSort
func spawn():
	var enemy = load("res://Enemy.tscn").instance()
	add_child(enemy)
	enemy.position = get_node("Player").position + Vector2(1000,0).rotated(rand_range(0, 2 * PI))
