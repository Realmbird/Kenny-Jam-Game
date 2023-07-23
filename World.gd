extends YSort
#var time = 1
#nready var timer = get_node("Timer")

func spawn():
	var enemy = load("res://Enemy.tscn").instance()
	add_child(enemy)
	enemy.position = get_node("Player").position + Vector2(50,0).rotated(rand_range(0, 2 * PI))
	print(enemy.position)
	#if time >= 0.8:
#		timer.wait_time = time 
	#	time = time - 0.0005
		
	#	print(time)
