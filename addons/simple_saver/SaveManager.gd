# Service to manage save game states
# Please add this script to Project -> Project Settings -> AutoLoad
# to use this service as singleton : MIT License
# @author Vladimir Petrenko
extends Node

signal loaded
signal saved

var _path_to_save_data = "user://save.tres"
var _save_data = SaveData.new()
var _changed = false

func _ready() -> void:
	load_game()

func load_game() -> void:
	var loaded_save_data = load(_path_to_save_data)
	if loaded_save_data:
		_save_data = loaded_save_data
		_changed = false
		emit_signal("loaded")

func save_game() -> void:
	if _changed:
		var state = ResourceSaver.save(_path_to_save_data, _save_data)
		if state == OK:
			_changed = false
			emit_signal("saved")
		else:
			push_error("Can't save game")

func get_by_key(key: String):
	if _save_data.data.has(key):
		return _save_data.data.get(key)
	return null

func set_by_key(key: String, value) -> void:
	_save_data.data[key] = value
	_changed = true

func delete_by_key(key: String) -> void:
	if _save_data.data.has(key):
		_save_data.data.erase(key)
		_changed = true
