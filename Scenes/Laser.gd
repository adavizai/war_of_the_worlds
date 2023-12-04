extends Area2D


var speed := 500.0

var movement_vector := Vector2(0, -1)

func _physics_process(delta):
	global_position += movement_vector.rotated(rotation) * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
#ffffffff
