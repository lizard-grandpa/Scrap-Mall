extends Timer
export (int) var rounds = 1


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CheckToasters_timeout():
	var enemyCount = get_tree().get_nodes_in_group("Enemy").size()
	if(rounds > 0 and enemyCount < 1 ):
		get_tree().get_nodes_in_group("Spawner").front().get_node("Timer").start()
		rounds-= 1
	pass # Replace with function body.
