extends Node2D

const card_base = preload("res://assets/cards/card_base.tscn")
const hand = preload("res://PlayerHand.gd")
const card_database = preload("res://assets/cards/CardDatabase.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Handle inputs
	if Input.is_action_just_pressed("ui_accept"):
		var card = card_base.instantiate().setup((randi_range(3, 53)))

		$PlayerHand.add_card(card)

		# TODO: Remove this
		var other_players = get_node("./OtherPlayers")
		if other_players.player_count < 5:
			other_players.add_player()
		else:
			other_players.deal_cards(1)
