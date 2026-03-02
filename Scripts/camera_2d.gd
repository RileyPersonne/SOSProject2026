extends Camera2D

const SPEED = 2

func _physics_process(delta: float) -> void:
	
	#get input
	var h_direction = Input.get_axis("left", "right")
	var v_direction = Input.get_axis("up", "down")
	
	if h_direction:
		position.x += h_direction * SPEED
		
	if v_direction:
		position.y += v_direction * SPEED
