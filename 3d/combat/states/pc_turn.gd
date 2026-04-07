class_name PC_Turn
extends State


@onready var map: Map3D = $"../../Map"


var character: Character3D
var turn : int


func handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("click"):
		if map.get_current_tile().t_name == "available":
			character.pos = map.current_coords
			character.position.x = (map.get_current_tile().position.x - 1.25)
			character.position.z = (map.get_current_tile().position.z - .5)
		map.reset_tiles()
		map.draw_zone(character.pos, character.data.movement_range)
		get_tree().current_scene.next_turn()


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass


func enter(prev) -> void:
	map.reset_tiles()
	map.draw_zone(character.pos, character.data.movement_range)


func exit() -> void:
	pass
