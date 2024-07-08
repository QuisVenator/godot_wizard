extends Node2D

@onready var hand_center = Vector2(get_viewport().size) * Vector2(0.5, 2.65)
# rad1 = card.size[0] / 2
@onready var rad2 = get_viewport().size[1] * 4

var cards = []
var selected_card = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("rightclick") and selected_card != null:
		remove_card(selected_card)
	elif Input.is_action_just_pressed("leftclick") and selected_card != null:
		play_card(selected_card)

func highlight(card):
	for c in get_children():
		if c != card:
			c.set_modulate(Color(0.5, 0.5, 0.5))
		else:
			c.set_modulate(Color(1, 1, 1))

func select_card(card):
	selected_card = card

func deselect_card():
	selected_card = null

func unhighlight():
	for c in get_children():
		c.set_modulate(Color(1, 1, 1))

func add_card(card):
	cards.append(card)
	arrange_cards()
	add_child(card)
	print("Card added to scene.")

func remove_card(card):
	if selected_card == card:
		deselect_card()

	cards.erase(card)
	remove_child(card)
	# Delete node
	card.queue_free()
	arrange_cards()
	print("Card removed from scene.")

func play_card(card):
	if selected_card == card:
		deselect_card()

	card.disconnect("mouse_entered", card.mouse_over)
	card.disconnect("mouse_exited", card.mouse_exit)
	$"../PlayedCards".play_card(card)
	cards.erase(card)
	arrange_cards()
	print("Card played.")

func arrange_cards():
	var num_cards = cards.size()
	var per_card_angle = PI / 150
	var per_card_rotation = PI / 300
	var cards_to_left = num_cards / 2.0 - 0.5

	if num_cards == 0:
		return
	
	var angle = -PI / 2 - per_card_angle * cards_to_left
	var card_rotation = - per_card_rotation * cards_to_left

	for card in cards:
		card.position = Vector2(hand_center.x + rad2 * cos(angle), hand_center.y + card.size[1] * 8 * sin(angle))
		card.position -= (card.size / 2).rotated(card_rotation)
		card.rotation = card_rotation
		angle += per_card_angle
		card_rotation += per_card_rotation
