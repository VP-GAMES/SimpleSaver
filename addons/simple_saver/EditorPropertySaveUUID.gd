# EditorProperty as Inventory for InventoryEditor : MIT License
# @author Vladimir Petrenko
extends EditorProperty
class_name EditorPropertySaveUuid

const UUID = preload("res://addons/simple_saver/uuid/uuid.gd")
const icon = preload("res://addons/simple_saver/icons/Reload.png")

var updating = false
var hBox = HBoxContainer.new()
var button = Button.new()
var text = LineEdit.new()

func _init():
	button.icon = icon
	button.hint_tooltip = "Refresh uuid"
	hBox.add_child(button)
	text.size_flags_horizontal = SIZE_EXPAND_FILL
	hBox.add_child(text)
	add_child(hBox)
	button.connect("pressed", self, "on_button_pressed")

func on_button_pressed():
	if (updating):
		return
	emit_changed(get_edited_property(), UUID.v4())

func update_property():
	var new_value = get_edited_object()[get_edited_property()]
	updating = true
	text.text = new_value
	updating = false
