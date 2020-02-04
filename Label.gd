extends Label

var scraps = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
#Increases scraps when the player collides with the scrap 
func _on_Scraps_increaseScraps():
	scraps = scraps + randi() % 3 + 1
	print(scraps)
	self.text = str(scraps)

#Increases scraps when the player collides with the trash object
func _on_Trash_increaseScraps():
	scraps = scraps + 5
	print(scraps)
	self.text = str(scraps)
