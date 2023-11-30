extends CharacterBody2D
@onready var label = get_tree().get_root().get_node("Space").get_node("CanvasLayer").get_node("Label")
const SPEED = 100.0
var life = 100

func _physics_process(delta):
	print(label)
	if life <= 0:
		queue_free()
		label.text = str(int(label.text) + 5)
	else:
		velocity.y = SPEED
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		life -= 20
