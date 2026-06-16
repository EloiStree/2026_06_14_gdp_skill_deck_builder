extends Node


@export var to_test:DeckBuildSetMainCanvas
@export_multiline()
var text:String="test"
@export var texture:Texture2D

@export var scene_ui:PackedScene

@export var time_between_test:float=3

func _ready() -> void:
	while true:
		to_test.set_with_rich_text(text)
		await get_tree().create_timer(time_between_test).timeout
		to_test.set_with_texture(texture)
		await get_tree().create_timer(time_between_test).timeout
		to_test.set_with_scene_ui2d(scene_ui)
		await get_tree().create_timer(time_between_test).timeout
	
