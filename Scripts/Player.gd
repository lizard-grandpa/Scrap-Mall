extends KinematicBody2D

export (int) var moveSpeed = 100
var GRAVITY = 9.8
var velocity = Vector2()
var xHandPos = 83
var yHandPos = -8
var isPunchAnim = false



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

		
		
func get_input():
	if Input.is_action_pressed("back_hand"):
		$FrontHand.set_scale(Vector2(1,1))
#		$BackHand.set_position(Vector2(13,0))
		if $AnimatedSprite.is_flipped_h():
			$CollisionShape2D.set_position(Vector2(-19,0))
			$FrontHand.set_position(Vector2(61,-11))
		else:
			$FrontHand.set_position(Vector2(-31,-13))
			$CollisionShape2D.set_position(Vector2(19,0))
		$AnimatedSprite.play("c_punch_front")
		isPunchAnim = true
		
#	elif Input.is_action_pressed("front_hand"):
#		$FrontHand.set_position(Vector2(81,-8))
#		$BackHand.set_position(Vector2.ZERO)
#		$AnimatedSprite.play("c_punch_back")
#		isPunchAnim = true
	else:
		$FrontHand.set_scale(Vector2(.1,.1))
		$FrontHand.set_position(Vector2.ZERO)
#		$BackHand.set_position(Vector2.ZERO)
		isPunchAnim = false
	velocity = Vector2()
	
	if !isPunchAnim:
		if Input.is_action_pressed("up"):
			velocity.y -= 1
			if !isPunchAnim:
				$AnimatedSprite.play("c_walk")
		elif Input.is_action_pressed("down"):
			velocity.y += 1
			if !isPunchAnim:
				$AnimatedSprite.play("c_walk")
		elif Input.is_action_pressed("left"):
			velocity.x -= 1
			if !isPunchAnim:
				$AnimatedSprite.play("c_walk")
			$AnimatedSprite.set_flip_h(false)
		elif Input.is_action_pressed("right"):
			velocity.x += 1
			if !isPunchAnim:
				$AnimatedSprite.play("c_walk")
			$AnimatedSprite.set_flip_h(true)
		else:
			if !isPunchAnim:
				$AnimatedSprite.play("c_idle")
			
		velocity *= moveSpeed
		pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	move_and_slide(velocity)
	for i in get_slide_count():
		if get_slide_collision(i).collider.name == "Toast":
			$PlayerHealth.set_value($PlayerHealth.get_value() - 10)
			get_slide_collision(i).collider.set_position(Vector2(-3000,-2000))
		elif get_slide_collision(i).collider.name == "Toaster":
			$PlayerHealth.set_value($PlayerHealth.get_value() - 1)
	if $PlayerHealth.get_value() < 1:
		get_parent().remove_child(self)
	


	
