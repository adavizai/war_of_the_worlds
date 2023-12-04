
extends KinematicBody2D

export (PackedScene) var Laser


signal laser_shot(laser)

var velocity = Vector2(0,0)
const SPEED = 100

var rspeed = 300


func _physics_process(delta):
  # Input handling
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# Normalize the velocity to ensure consistent speed diagonally
	velocity = velocity.normalized() * SPEED

	# Move the player
	move_and_slide(velocity)

	# Rotate the player
	if velocity.length_squared() > 0:
		$Sprite.rotation = velocity.angle() + deg2rad(90) # Adjust rotation by 90 degrees
		
func _unhandled_input(event: InputEvent) -> void: 
	if event.is_action_released("ui_select"):
		shoot()

func shoot():
	if not Laser:
		print("Error: Laser scene not assigned.")
		return

	var laser_instance = Laser.instance()
	if not laser_instance:
		print("Error: Failed to create Laser instance.")
		return

	add_child(laser_instance)
	
	if $Sprite:
		laser_instance.rotation = $Sprite.rotation
	else:
		print("Error: Sprite node not found.")
