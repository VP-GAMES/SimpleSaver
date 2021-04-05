tool
extends EditorPlugin


var _simple_saver_editor_inspector_plugin

func _enter_tree():
	_simple_saver_editor_inspector_plugin = preload("res://addons/simple_saver/EditorInspectorPluginSaveUUID.gd").new()
	add_inspector_plugin(_simple_saver_editor_inspector_plugin)

func _exit_tree():
	remove_inspector_plugin(_simple_saver_editor_inspector_plugin)
