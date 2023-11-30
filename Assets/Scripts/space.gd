extends Node2D

@export var smallEnemySpaceShips : PackedScene
@export var LargeEnemySpaceShips : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_large_eneemy_timer_timeout():
	createEnemy(LargeEnemySpaceShips)


func _on_small_enemy_timer_timeout():
	createEnemy(smallEnemySpaceShips)
	
	
func createEnemy(enemy):
	var enemyShip = enemy.instantiate()
	enemyShip.position.y = -20
	enemyShip.position.x = randi_range(50, 600)
	get_parent().add_child(enemyShip)
