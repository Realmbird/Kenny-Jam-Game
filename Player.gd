extends KinematicBody2D
var health = 100




const ACCELERATION = 200
const MAX_SPEED = 200
const FRICION = 400


var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	update_health()
	if Globals.kills > 10 && Input.is_action_just_pressed("ui_accept"):
		slam()
		Globals.kills -= 4
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	input_vector = input_vector.normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICION * delta)
	velocity = move_and_slide(velocity)

func update_health():
	var healthbar = $healthbar
	healthbar.set_value(health)
	
	if health >= 100:
		healthbar.visible = false
	else: 
		healthbar.visible = true
	


func _on_regen_timer_timeout():
	shoot()
	if health < 100:
		health = health + 20
		if health > 100:
			health = 100
	if health <= 0:
		health = 0
		get_tree().reload_current_scene()
		
func shoot():
	var bullet = load("res://Attacks/Floating Sword.tscn").instance()
	add_child(bullet)
func hit():
	health -= 10
	update_health()
func slam():
	var slam = load("res://New Attacks/Slam.tscn").instance()
	add_child(slam)
	

	


