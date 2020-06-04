extends MeshInstance


var vertices: PoolVector3Array
var uvs: PoolVector2Array
var normals: PoolVector3Array
var triangles: PoolIntArray
var HexMetrics = preload("res://HexMetrics.gd")
var surface_tool = SurfaceTool.new()
var HexMaterial = preload("res://hex_mat.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func triangulate_cells(cells: Array):
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	var _v_empty = vertices.empty()
	var _t_empty = triangles.empty()
	
	for i in range(cells.size()):
		_triangulate_cell(cells[i])

	surface_tool.set_material(HexMaterial)

	var mesh = surface_tool.commit()
	print(mesh.get_surface_count())
	# Saves mesh to a .tres file with compression enabled.
	var _r_save = ResourceSaver.save("res://hex_mesh.tres", mesh, 32)

	self.set_mesh(mesh)


func _triangulate_cell(cell:Spatial):
	var center:Vector3 = cell.transform.origin

	for i in range(6):
		_add_triangle(
			center,
			center + HexMetrics.CORNERS[i],
			center + HexMetrics.CORNERS[i + 1]
		)


func _add_triangle(v1:Vector3, v2:Vector3, v3:Vector3):
	var vertex_index:int = vertices.size()

	surface_tool.add_normal(v1.normalized())
	surface_tool.add_index(vertex_index)
	surface_tool.add_uv(Vector2(0, 0))
	surface_tool.add_vertex(v1)
	
	surface_tool.add_normal(v2.normalized())
	surface_tool.add_index(vertex_index + 1)
	surface_tool.add_uv(Vector2(0, 1))
	surface_tool.add_vertex(v2)
	
	surface_tool.add_normal(v3.normalized())
	surface_tool.add_index(vertex_index + 2)
	surface_tool.add_uv(Vector2(1, 1))
	surface_tool.add_vertex(v3)
