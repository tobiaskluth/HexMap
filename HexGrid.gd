extends Spatial


export var width := 1
export var height := 1
export var cell_prefab = preload("res://HexCell.tscn")

var cells: Array
var HexMetrics = preload("res://HexMetrics.gd")

onready var GUICanvas = $'Viewport/3DGUI'
onready var HexMesh = $'HexMesh'

# Called when the node enters the scene tree for the first time.
func _ready():
	var i := 0

	for z in range(height):
		for x in range(width):
			cells.insert(i, create_cell(x, z, i))
			i += 1
	
	HexMesh.triangulate_cells(cells)

func create_cell(var x: int, var z: int, var _i: int):
	var position = Vector3(
			(x + z * 0.5 - z / 2) * (HexMetrics.INNER_RADIUS * 2.0), 
			0, 
			z * (HexMetrics.OUTER_RADIUS * 1.5)
	)
	
	var cell = cell_prefab.instance()
	cell.transform = Transform.IDENTITY.translated(position)

	add_child(cell)
	
	GUICanvas.create_label(Vector2(position.x, position.z), Vector2(x, z))
	
	return cell
