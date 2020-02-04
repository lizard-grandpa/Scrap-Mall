extends KinematicBody2D

export (int) var moveSpeed
var player
var velocity
var onScreen
var toastVel =Vector2()
var fireToast = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("Player").front()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print($Toast.position)
	if $VisibilityNotifier2D.is_on_screen() and !onScreen:
		onScreen = true
#		print("yo")
		$ToastTime.start()
	
		
	var playerAngle = get_angle_to(player.get_position())  
	velocity = Vector2(cos(playerAngle),sin(playerAngle)) * moveSpeed
	move_and_slide(velocity)
	if(fireToast) and $Toast != null:
		$Toast.move_and_slide(toastVel)
	for i in get_slide_count():
		if get_slide_collision(i).collider.name == "BackHand" or get_slide_collision(i).collider.name == "FrontHand":
			$ProgressBar.set_value($ProgressBar.get_value() - 1)
	if $ProgressBar.get_value() < 1:
		get_parent().remove_child(self)
	
	


func _on_ToastTime_timeout():
#	print("toast fired")
	fireToast = true
	var toastAngle = get_angle_to((player.get_position()))
	toastVel = Vector2(cos(toastAngle),sin(toastAngle))* moveSpeed * 2





func _on_VisibilityNotifier2D_screen_exited():
#	print("Toast Waisted")
	fireToast = false
	$Toast.position= Vector2.ZERO
	onScreen = false
	pass # Replace with function body. 
