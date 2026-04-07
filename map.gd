class_name Map3D
extends Node3D

const TILE = preload("uid://cecwkn0diag3f")


@export var width = 7
@export var height = 6


var current_coords :=Vector2i(0,0)
var map = []


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


func draw_zone(origin, range) -> void:
	for i in range((range * 2) + 1):
		if origin.x - range + i < len(map) and origin.x - range + i >= 0 and not map[origin.x - range + i][origin.y].has_entity:
			map[origin.x - range + i][origin.y].change_texture("available")
		if origin.y - range + i >= 0 and origin.y - range + i < len(map[0]) and not map[origin.x][origin.y - range + i].has_entity: 
			map[origin.x][origin.y - range + i].change_texture("available")
	for i in range(range + 1):
		var remainder = (range + 1) + (i-(range + 1))
		if remainder > 0:
			for j in (remainder*2)+1:
				if origin.y - remainder + j >= 0 and origin.y - remainder + j < len(map[0])  and origin.x - range + i >= 0 and origin.x - range + i < len(map) and not map[origin.x - range + i][origin.y - remainder + j].has_entity:
					map[origin.x - range + i][origin.y - remainder + j].change_texture("available")
				if origin.y - remainder + j >= 0 and origin.y - remainder + j < len(map[0])  and origin.x + range - i >= 0 and origin.x + range - i < len(map) and not map[origin.x + range - i][origin.y - remainder + j].has_entity:
					map[origin.x + range - i][origin.y - remainder + j].change_texture("available")


func get_current_tile():
	return map[current_coords.x][current_coords.y]


func reset_tiles() -> void:
	for r in map:
		for t in r:
			t.change_texture("default")


func _process(delta: float) -> void:
	pass
