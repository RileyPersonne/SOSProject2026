extends Node3D


@export var players : Array[character_data_3d]
#@export var enemies : Array[character_data_3d]

@onready var camera: Camera3D = $Camera3D
@onready var state_machine: StateMachine = $StateMachine
@onready var map: Map3D = $Map


const PLAYER = preload("uid://dsgp08lqmo3ij")
const PcTurn = preload("uid://uyn8raxrg5vh")


var turn : int = 0
var turn_order : Array[State]


func _ready() -> void:
	var i = 0
	for character in players:
		var player = PLAYER.instantiate()
		add_child(player)
		player.position.x = (map.map[character.pos.x][character.pos.y].position.x - 1.25)
		player.position.y = .1
		player.position.z = (map.map[character.pos.x][character.pos.y].position.z - .5)
		player.data = character
		map.map[character.pos.x][character.pos.y].has_entity = true
		var character_turn = PcTurn.new()
		state_machine.add_child(character_turn)
		character_turn.character = player
		character_turn.turn = i
		turn_order.append(character_turn)
		i += 1
	state_machine.transition(turn_order[0].name)


func next_turn() -> void:
	turn = (turn+1)%len(turn_order)
	state_machine.transition(turn_order[turn].name)

func _process(delta: float) -> void:
	pass
