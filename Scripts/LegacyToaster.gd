extends KinematicBody2D

export (int) var moveSpeed
var player
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("Player").front()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var playerAngle = get_angle_to(player.get_position()) 
	velocity = Vector2(cos(playerAngle),sin(playerAngle)) * moveSpeed
	move_and_slide(velocity)
	
	for i in get_slide_count():
		if get_slide_collision(i).collider.name == "RightHand" or get_slide_collision(i).collider.name == "LeftHand":
			$ProgressBar.set_value($ProgressBar.get_value() - 1)
	if $ProgressBar.get_value() < 1:
		get_parent().remove_child(self)
	
	
