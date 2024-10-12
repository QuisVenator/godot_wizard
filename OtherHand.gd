extends Node2D

@export var handnum : int

const card_base = preload("res://assets/cards/card_base.tscn")
const card_database = preload("res://assets/cards/CardDatabase.gd")

var score = 0
var placed_bet = 0
var trick_count = 0
var points = 0
var cards = []
var rotation_for_cards = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func play_card():
	pass

func give_cards(num_cards):
	for i in range(num_cards):
		var card = card_base.instantiate().setup(card_database.BACK)
		card.scale = Vector2(0.7, 0.7)
		card.set_rotation(rotation_for_cards)
		cards.append(card)
		add_child(card)
		arrange_cards()

func arrange_cards():
	var num_cards = cards.size()
	var cards_to_left = num_cards / 2.0 - 0.5
	var card_spacing = cards[0].get_size().x * 0.3
	var overlap_off = cards[0].get_size() / 2
	if rotation_for_cards == deg_to_rad(270):
		overlap_off *= 0

	for i in range(num_cards):
		var offset = Vector2((i - cards_to_left) * card_spacing, 0) + overlap_off
		var offset_rotaded = offset.rotated(rotation_for_cards)
		cards[i].set_global_position(global_position + offset_rotaded)
	#TODO remove debug and set the card size correction correctly
	# for i in range(cards.size()):
	# 	cards[i].set_global_position(self.global_position - offset)

func place_bet(bet):
	placed_bet = bet

func take_trick():
	trick_count += 1

func end_round():
	trick_count = 0
	placed_bet = 0
