extends MarginContainer

var CardDatabase = preload("res://assets/cards/CardDatabase.gd")
var CardId = CardDatabase.BACK
var CardInfo
var original_z_index = 0
var original_sib_index = 0
var played = false
var exited_time = 0
var has_mouse_foucs = false


func setup(card_id: int):
	CardId = card_id
	return self

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect signals
	connect("mouse_entered", self.mouse_over)
	connect("mouse_exited", self.mouse_exit)

	self.CardInfo = CardDatabase.DATA[CardId]

	$Card.texture = load(CardInfo.image)
	$Card.scale = size/$Card.texture.get_size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func mouse_over():
	if played:
		return
	if CardId == CardDatabase.BACK:
		return
	if Time.get_ticks_msec() - exited_time < 2:
		return
	if self.has_mouse_foucs:
		return
	exited_time = Time.get_ticks_msec()
	self.has_mouse_foucs = true

	get_parent().highlight(self)
	get_parent().select_card(self)
	position = position - (size * 0.05).rotated(rotation) + Vector2(0, -size[1]/8).rotated(rotation)
	$Card.scale = size/$Card.texture.get_size() * 1.1
	self.original_z_index = $Card.z_index
	self.original_sib_index = get_index()
	self.move_to_front()
	$Card.z_index = 3000

func mouse_exit():
	if not has_mouse_foucs:
		return
	if Time.get_ticks_msec() - exited_time < 2:
		return
	self.has_mouse_foucs = false
	exited_time = Time.get_ticks_msec()
		
	get_parent().unhighlight()
	get_parent().deselect_card()
	position = position + (size * 0.05).rotated(rotation) + Vector2(0, size[1]/8).rotated(rotation)
	$Card.scale = size/$Card.texture.get_size() * 1
	$Card.z_index = self.original_z_index
	get_parent().move_child(self, self.original_sib_index)
