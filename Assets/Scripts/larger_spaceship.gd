extends CharacterBody2D
@onready var label = get_tree().get_root().get_node("Space").get_node("CanvasLayer").get_node("Label")
const SPEED = 50.0
var life = 250

func _physics_process(delta):
	if life <= 0:
		queue_free()
		label.text = str(int(label.text) + 20)
	else:
		velocity.y = SPEED
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		life -= 20
