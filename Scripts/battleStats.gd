extends Resource
class_name BattlerStats

enum BattlerType{
	PLAYER,
	ENEMY
}

@export var type : BattlerType
@export var max_hp : int
@export var min_damage : int
@export var max_damage : int
@export var turn_speed : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
