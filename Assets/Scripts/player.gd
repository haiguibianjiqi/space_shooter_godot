extends CharacterBody2D

#@onready var bullet = preload("res://Assets/Prefabs/player_space_bullet.tscn")
@export var bulletScene : PackedScene

const SPEED = 300.0

func _physics_process(delta):
	# Add the gravity.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directionY = Input.get_axis("ui_up", "ui_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if Input.is_action_just_pressed("shoot"):
		shootingLaser()
	move_and_slide()


func shootingLaser():
	var laserBullet = [createBullet(), createBullet()]
	laserBullet[0].position = $left_gun.global_position
	laserBullet[1].position = $right_gun.global_position
	for bullets in laserBullet:
		get_parent().add_child(bullets)

	
	
func createBullet():
	return bulletScene.instantiate()
