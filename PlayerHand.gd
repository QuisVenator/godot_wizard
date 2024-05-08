extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func highlight(card):
	for c in get_children():
		if c != card:
			c.set_modulate(Color(0.5, 0.5, 0.5))
		else:
			c.set_modulate(Color(1, 1, 1))

func unhighlight():
	for c in get_children():
		c.set_modulate(Color(1, 1, 1))