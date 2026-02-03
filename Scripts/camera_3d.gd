extends Camera3D

var person = 1

func _ready() -> void:
	position.x = 0.1
	

func _physics_process(delta: float) -> void:
	
	#get input
	var h_direction = Input.is_action_just_pressed('click')
		
	#move horizontal
	if h_direction:
		person += 1
		print(position.x)
		position.x += 0.2
		if person > 3: 
			person = 1
			position.x = 0.1
				
