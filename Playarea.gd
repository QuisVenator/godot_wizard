extends Node2D

const CardBase = preload("res://assets/cards/card_base.tscn")
const CardDatabase = preload("res://assets/cards/CardDatabase.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("leftclick"):
		var card = CardBase.instantiate().setup((randi_range(3, 53)))
		card.position = get_viewport().get_mouse_position()
		add_child(card)
		print("Card added to scene.")
