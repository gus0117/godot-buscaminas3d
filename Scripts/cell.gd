extends RigidBody3D
class_name Cell

const OFF_MATERIAL := preload("res://Assets/Materials/cube_off.tres")
const ON_MATERIAL := preload("res://Assets/Materials/cube_on.tres")
@onready var cubeMesh : MeshInstance3D = $CubeMesh

var value : int
var posX : int
var posY : int

func _ready():
	$Value/Sprite3D.visible = false
	$Value/Label3D.visible = false
	unselectCell()

func setParams(v: int, x: int, y: int) -> void:
	value = v
	posX = x
	posY = y

func revealValue() -> void:
	if value == -1:
		$Value/Sprite3D.visible = true
	elif value > 0:
		$Value/Label3D.visible = true
		$Value/Label3D.text = str(value)

func selectCell() -> void:
	$CubeMesh.material_override = ON_MATERIAL
	pass

func unselectCell() -> void:
	$CubeMesh.material_override = OFF_MATERIAL
	pass
