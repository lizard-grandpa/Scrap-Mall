extends Node2D
export (int) var numOfToasters
export (Vector2) var posRange
onready var toaster = load("res://Assets/Scenes/Toaster.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var trigger = false
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TriggerToasters_body_entered(body):
	if !trigger:
		$Timer.start()
		trigger = true
	


func _on_Timer_timeout():
	var simpleArray = []
	for i in range(numOfToasters):
		var a = toaster.instance()
		a.set_position(Vector2(randi() % 500 - 250, randi() % 500 - 250) + $SpawnToasters.get_position())
		simpleArray.append(a.position)
		add_child(a)
	pass # Replace with function body.
