class_name PC_Turn
extends State


@onready var map: Map3D = $"../../Map"


var character: Character3D
var turn : int


func handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("click"):
		if map.get_current_tile().t_name == "available":
			map.map[character.data.pos.x][character.data.pos.y].has_entity = false
			character.data.pos = map.current_coords
			character.position.x = (map.get_current_tile().position.x - 1.25)
			character.position.z = (map.get_current_tile().position.z - .5)
			map.get_current_tile().has_entity = true
		map.reset_tiles()
		map.draw_zone(character.data.pos, character.data.movement_range)
		get_tree().current_scene.next_turn()


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass


func enter(prev) -> void:
	print(character.data.name)
	map.reset_tiles()
	map.draw_zone(character.data.pos, character.data.movement_range)


func exit() -> void:
	pass
