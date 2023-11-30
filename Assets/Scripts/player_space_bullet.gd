extends CharacterBody2D


const SPEED = 300.0
var timeToDie = 1000


func _physics_process(delta):
	if timeToDie <= 0:
		queue_free()
	else:
		timeToDie -=5
		velocity.y = -SPEED
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Enemy"):
		queue_free()
