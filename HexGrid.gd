extends Spatial


export var width := 6
export var height := 6
export var cell_prefab = preload("res://HexCell.tscn")

var cells: Array

onready var gui_canvas = $'Viewport/3D_GUI'

# Called when the node enters the scene tree for the first time.
func _ready():
	var i := 0
	for z in range(height):
		for x in range(width):
			cells.insert(i, create_cell(x, z, i))
			i += 1

func create_cell(var x: int, var z: int, var _i: int):
	var position = Vector3(
			x * 2, 
			0, 
			z * 2
	)
	
	var cell = cell_prefab.instance()
	cell.transform = Transform.IDENTITY.translated(position)

	add_child(cell)
	
	gui_canvas.create_label(position)
	
	return cell
