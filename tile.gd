extends MeshInstance3D

signal entered(position : Vector2i)

var pos = Vector2i(0,0)

@onready var collision_shape_3d: CollisionShape3D = $Area3D/CollisionShape3D

@export_category("textures")
@export var default : Texture2D
@export var available : Texture2D
@export var danger : Texture2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func change_texture(texture_name) -> void:
	mesh.material.albedo_texture = available
	
	
func get_width() -> float:
	return get_node("Area3D/CollisionShape3D").shape.size.x


func _on_area_3d_mouse_entered() -> void:
	print("mouse entered: ", pos.x, pos.y)
	entered.emit(pos)
