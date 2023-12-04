extends Sprite
var speed = 150
var velocity = Vector2()

func _process(delta):
	velocity.x = int(Input.is_action_just_pressed("ui_right"))
	velocity.y = int(Input.is_action_just_pressed("ui_down"))

	velocity = velocity.normalized()
	
	global_position += speed * velocity * delta
