extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_card(card):
	card.reparent(self)
	card.global_position = global_position - (card.size / 2).rotated(card.rotation) + Vector2(randi_range(-10, 10), randi_range(-10, 10))
	card.rotation += randf_range(-0.5, 0.5)
