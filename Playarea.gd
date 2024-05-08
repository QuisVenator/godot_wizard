extends Node2D

const card_base = preload("res://assets/cards/card_base.tscn")
const hand = preload("res://PlayerHand.gd")
const card_database = preload("res://assets/cards/CardDatabase.gd")

@onready var hand_center = Vector2(get_viewport().size) * Vector2(0.5, 2.65)

# rad1 = card.size[0] / 2
@onready var rad2 = get_viewport().size[1] * 4
var angle = -PI / 2 - PI / 150 * 9
var card_rotation = - PI / 300 * 9

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("leftclick"):
		var card = card_base.instantiate().setup((randi_range(3, 53)))

		# The position of the card is set on the elipse formed by rad1 = card.size[1] / 2 and rad2, centered at hand_center
		card.position = Vector2(hand_center.x + rad2 * cos(angle), hand_center.y + card.size[1] * 8 * sin(angle))
		card.position -= (card.size / 2).rotated(card_rotation)
		card.rotation = card_rotation
		angle += PI / 150
		card_rotation += PI / 300
		$PlayerHand.add_child(card)
		print("Card added to scene.")
