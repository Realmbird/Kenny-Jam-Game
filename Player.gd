extends KinematicBody2D
var health = 100


const NEAR_DISTANCE = 50

const ACCELERATION = 200
const MAX_SPEED = 200
const FRICION = 400
var animated_sprite

var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = get_parent().get_node("Chest")

func _physics_process(delta):
	  # Get the player's global position
	var player_position = self.global_position

	# Get the AnimatedSprite's global position
	var sprite_position = animated_sprite.global_position

	# Calculate the distance between the player and the AnimatedSprite
	var distance = player_position.distance_to(sprite_position)

	# Check if the player is near the AnimatedSprite
	if distance < NEAR_DISTANCE:

		if Input.is_action_just_pressed("ui_accept"):
			print('pressed')
			animated_sprite.play('open')
			# Function to play the specified animation once

	update_health()


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
	if health < 100:
		health = health + 20
		if health > 100:
			health = 100
	if health <= 0:
		health = 0

	

	


