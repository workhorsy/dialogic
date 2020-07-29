tool
extends CheckBox

var current_piece

func _ready():
	current_piece = get_parent().get_parent().get_parent()
	connect("toggled", self, "_on_VisibleToggle_toggled")

func _on_VisibleToggle_toggled(button_pressed):
	var current_rect_size = current_piece.get("rect_size")
	if button_pressed:
		# TODO: Replace all this "get node" with a better way
		# to only show the header node and hide the rest of the
		# children for the main VBoxContainer
		current_piece.get_node("VBoxContainer/TextEdit").set("rect_min_size", Vector2(0, 80))
		current_piece.get_node("VBoxContainer/Header/Preview").hide()
		current_piece.get_node("VBoxContainer/TextEdit").show()
	else:
		# TODO: Same here.
		current_piece.get_node("VBoxContainer/TextEdit").hide()
		current_piece.get_node("VBoxContainer/Header/Preview").show()
		current_piece.get_node("VBoxContainer/TextEdit").set("rect_min_size", Vector2(0, 0))
		#$VBoxContainer.set("rect_size", Vector2(0,0))
		current_piece.set("rect_size", Vector2(current_rect_size.x,0))
