tool
extends EditorPlugin

const MainPanel = preload("res://addons/project-time-godot3/main_panel.tscn")

var main_panel_instance

func _enter_tree():
	main_panel_instance = MainPanel.instance()
	add_control_to_bottom_panel(main_panel_instance, "Test")
	# Add the main panel to the editor's main viewport.
	get_editor_interface().get_editor_viewport().add_child(main_panel_instance)
	# Hide the main panel. Very much required.
	make_visible(false)


func _exit_tree():
	remove_control_from_bottom_panel(main_panel_instance)
	if main_panel_instance:
		main_panel_instance.queue_free()


func has_main_screen():
	return true


func make_visible(visible):
	if main_panel_instance:
		main_panel_instance.visible = visible


func get_plugin_name():
	return "Project Time Plugin"


func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")
