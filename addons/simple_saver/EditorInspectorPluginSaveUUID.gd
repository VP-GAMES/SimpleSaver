# InspectorPlugin for SimpleSaver : MIT License
# @author Vladimir Petrenko
extends EditorInspectorPlugin

func can_handle(object):
	return true

func parse_property(object, type, path, hint, hint_text, usage):
	if type == TYPE_STRING and path == "save_uuid":
		var editorPropertySaveUuid = EditorPropertySaveUuid.new()
		add_property_editor(path, editorPropertySaveUuid)
		return true
	return false
