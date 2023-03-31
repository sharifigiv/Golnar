extends Sprite

var rotated : int = 0
var balal : bool = false
var in_game : bool = false
var can_rotate : bool = false
var can_move : bool = false


func _input(event):
	if (in_game == true and can_rotate == true):
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
			
			if get_rect().has_point(to_local(event.position)):
				
				rotated += 1
				balal = true
	if( can_move == true ):
		if event is InputEventMouseMotion and Input.is_mouse_button_pressed(1):
			position.y = event.position.y
			position.x = event.position.x
			
func _ready():
	pass

func _process(delta):
	if (rotated <= 2 and balal == true and in_game and can_rotate == true):
		rotate(1.5708)
		balal = false
		can_rotate = false
	if ( can_move == true ):
		pass
