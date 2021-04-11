extends KinematicBody2D

const GRAVITY = 2000
const SPEED = 500
const JAMP_FORCE = -900

var linear_velocity = Vector2(0,0)
var is_jumping = false
var is_moving = false
var is_alive = true


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass # Replace with function body.

func _physics_process(delta):
	
	linear_velocity.y += GRAVITY * delta
	if is_alive:
		if is_on_floor():
			linear_velocity.x = 0
		if is_jumping:
				linear_velocity.y = JAMP_FORCE
		elif is_moving:
			linear_velocity.x = SPEED
		else:
			linear_velocity.x = 0
		is_jumping = false
		
		if position.y > get_viewport_rect().size.y:
			#chamar a condição de morte do jogador
			pass
			
	linear_velocity = move_and_slide(linear_velocity, Vector2(0,-1))
