extends Container

export var label_prefab = preload("res://HexCellLabel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func create_label(var position: Vector3):
	var label = label_prefab.instance()
	
	label.text = String(position.x) + " / " + String(position.z)
	
	add_child(label)
