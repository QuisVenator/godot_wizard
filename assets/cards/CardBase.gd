extends MarginContainer

@onready var CardDatabase = preload("res://assets/cards/CardDatabase.gd")
@onready var CardId = CardDatabase.BACK
@onready var CardInfo = CardDatabase.DATA[CardId]


# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect signals
	connect("mouse_entered", self.mouse_over)
	connect("mouse_exited", self.mouse_exit)

	$Card.texture = load(CardInfo.image)
	$Card.scale = size/$Card.texture.get_size()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func mouse_over():
	$Card.modulate = Color(1, 1, 1, 0.8)

func mouse_exit():
	$Card.modulate = Color(1, 1, 1, 1)
