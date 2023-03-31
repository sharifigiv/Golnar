extends Node

var finder_tile : int = 1
var tiles = [[0,0,0],[0,0,0],[0,0,0]]
var tiles_objects = []
var tiles_order = [2,3,4,5,6,7,8,9]
var tiles_in_game = []
var game_mod : int = 0
var tiles_counter : int = 2 

func _on_add_pressed():
	game_mod = 1
	
func _on_rotate_pressed():
	game_mod = 2

func shuffleList(list):
	var shuffledList = []
	var indexList = range(list.size())
	for i in range(list.size()):
		randomize()
		var x = randi()%indexList.size()
		shuffledList.append(list[x])
		indexList.remove(x)
		list.remove(x)
	return shuffledList

func _ready():

	var n : int = 1

	for y in range(2,10):
		var address : String = "res://assets/"+str(y)+".jpeg"
		var counter = load(address)
		tiles_objects.append(counter)
	tiles_order = shuffleList(tiles_order)

	n = 2
	for i in tiles_order :
		if i != 0:
			var bullet = get_node("tile"+str(n))
			bullet.set_texture(tiles_objects[i-2])
			n += 1
			
	$tile1.in_game = true
	tiles_in_game.append(get_node("tile1"))
		
func _process(delta):
	
	if ( game_mod == 2 ):
		for i in range(len(tiles_in_game)):
			tiles_in_game[i].can_rotate = true
		game_mod = 0
		
	elif ( game_mod == 1 ):
		var s : String = "tile"+str(tiles_counter)
		get_node(s).can_move = true
		game_mod = 0
