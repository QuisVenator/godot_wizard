extends Node

var player_count = 0

@onready var pos_left =  Vector2(get_viewport().size) * Vector2(0.05, 0.3)
@onready var pos_right = Vector2(get_viewport().size) * Vector2(0.95, 0.3)
@onready var pos_top_center = Vector2(get_viewport().size) * Vector2(0.5, 0.08)
@onready var pos_top_left = Vector2(get_viewport().size) * Vector2(0.15, 0.08)
@onready var pos_top_right = Vector2(get_viewport().size) * Vector2(0.85, 0.08)

@onready var handpositions = [
	[],
	[
		pos_top_center,
	],
	[
		pos_top_left,
		pos_top_right,
	],
	[
		pos_left,
		pos_top_center,
		pos_right,
	],
	[
		pos_left,
		pos_top_left,
		pos_top_right,
		pos_right,
	],
	[
		pos_left,
		pos_top_left,
		pos_top_center,
		pos_top_right,
		pos_right,
	],
]

@onready var handrotations = [
	[],
	[
		180,
	],
	[
		180,
		180,
	],
	[
		90,
		0,
		270,
	],
	[
		90,
		180,
		180,
		270,
	],
	[
		90,
		180,
		180,
		180,
		270,
	],
]

var other_player_hands = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func add_player():
	player_count += 1
	var newplayer = get_node("./Hand"+str(player_count))
	other_player_hands.append(newplayer)
	update_player_count()

func update_player_count():
	for i in range(player_count):
		other_player_hands[i].set_global_position(handpositions[player_count][i])
		other_player_hands[i].rotation_for_cards = deg_to_rad(handrotations[player_count][i])

func remove_player():
	# TODO: implement
	pass

func deal_cards(num):
	for hand in other_player_hands:
		hand.give_cards(num)

func end_round():
	for hand in other_player_hands:
		hand.end_round()
