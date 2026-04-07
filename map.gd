class_name Map3D
extends Node3D

const TILE = preload("uid://cecwkn0diag3f")

@export var width = 7
@export var height = 6

var current_coords :=Vector2i(0,0)
var map = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for x in width:
		map.append([])
		for y in height:
			var tile = TILE.instantiate()
			var width = tile.get_width()
			tile.pos = Vector2i(x,y)
			tile.entered.connect(func(pos): current_coords = pos)
			map[x].append(tile)
			map[x][y].position = Vector3(0+(x/width), 0, 0+(y/width))
			self.add_child(map[x][y])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
