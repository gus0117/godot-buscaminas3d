extends RayCast3D

var currentTarget : Cell

func _input(event):
	if event.is_action_pressed("action") and currentTarget != null:
		currentTarget.revealValue()

func _physics_process(delta):
	#Raycast
	if is_colliding():
		if get_collider().is_in_group("Cell"):
			if currentTarget != get_collider():
				if currentTarget != null:
					currentTarget.unselectCell()
				currentTarget = get_collider()
				currentTarget.selectCell()
	else:
		if currentTarget != null:
			currentTarget.unselectCell()
