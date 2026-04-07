class_name PC_Turn
extends State

@onready var map: Map3D = $"../../Map"
@export var character: Character3D


func handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("click"):
		print(map.current_coords)
		map.map[map.current_coords.x][map.current_coords.y].change_texture("default")
		
func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	pass
	
func enter(prev) -> void:
	pass
	
func exit() -> void:
	pass
