extends Container

export var label_prefab = preload("res://HexCellLabel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func create_label(var position: Vector2, var index: Vector2):
	var label = label_prefab.instance()
	
	label.text = String(index.x) + "\n" + String(index.y)
	label.rect_position = position * Vector2(15, 15)
	
	self.add_child(label)
	label.set_owner(self)
