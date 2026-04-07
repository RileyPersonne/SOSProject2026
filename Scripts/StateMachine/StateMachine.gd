class_name StateMachine
extends Node


@export var initial_state: State = null

@onready var state: State = (func get_initial_state() -> State:
	return initial_state if initial_state != null else get_child(0)
).call()

func _ready() -> void:
	for state_node: State in find_children("*", "State"):
		state_node.finished.connect(transition)
		
	await owner.ready
	state.enter("")
	
	
func transition(target) -> void:
	if not has_node(target):
		printerr(owner.name + " failed to transition to: ", target, " but it doesnt exist")
		return
	
	var prev = state.name
	state.exit()
	state = get_node(target)
	state.enter(prev)
	
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)
	
func _process(delta: float) -> void:
	state.update(delta)
	
func _physics_process(delta: float) -> void:
	state.physics_update(delta)
	
