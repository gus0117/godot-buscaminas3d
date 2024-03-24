extends Node

const ROWS : int = 10
const COLS : int = 10
const AMOUNT_MINES : int = 10

#References
@export var cell : PackedScene = preload("res://Scenes/cell.tscn")
@onready var container : Node3D = $Board

var board : Array = []
var rng = RandomNumberGenerator.new()

#Settings
var posY : int = 0
var posX : int = 0
var space_between : float = 2.3


# Called when the node enters the scene tree for the first time.
func _ready():
	initArray()
	generateMines()
	generateValues()
	drawMines()


func initArray() -> void:
	for x in range(ROWS):
		board.append([])
		for y in range(COLS):
			board[x].append(0)

# Generate an array 2d with the mines positionated
func generateMines() -> void:
	var x: int
	var y: int
	var i: int = 0
	while i < AMOUNT_MINES:
		x = rng.randi_range(0, ROWS - 1)
		y = rng.randi_range(0, COLS - 1)
		if board[x][y] != -1:
			board[x][y] = -1
			i += 1

# Generate de values around the mines
func generateValues() -> void:
	for i in range(0, ROWS):
		for j in range(0, COLS):
			if board[i][j] != -1:
				checkAround(i, j)

# Generate the values around the mines part 2
func checkAround(x: int, y: int) -> void:
	for i in range(-1, 2):
		for j in range(-1, 2):
			if x + i < 0 or x + i>= ROWS:
				continue
			if y + j < 0 or y + j>= COLS:
				continue
			if board[x + i][y + j] == -1:
				board[x][y] += 1

# Set values to the cells
func drawMines() -> void:
	for i in range(0, ROWS):
		for j in range(0, COLS):
			var cellInstance = cell.instantiate()
			cellInstance.setParams(board[i][j], i, j)
			container.add_child(cellInstance)
			cellInstance.position = Vector3(posX + space_between * j, 0, posY + space_between * i)
