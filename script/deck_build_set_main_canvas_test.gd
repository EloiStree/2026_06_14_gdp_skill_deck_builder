class_name DeckBuildSetMainCanvasTest
extends Node


@export var _to_test:DeckBuildSetMainCanvas
@export_multiline()
var _text:String="test"
@export var _texture:Texture2D
@export var _scene_ui:PackedScene
@export var _time_between_test:float=3

@export var _use_test:bool=true
func _ready() -> void:
	if not _to_test:
		return 
	if not _texture:
		return 
	if not _scene_ui:
		return 
	if not _text:
		return 
		
	while _use_test:
		_to_test.set_with_rich_text(_text)
		await get_tree().create_timer(_time_between_test).timeout
		_to_test.set_with_texture(_texture)
		await get_tree().create_timer(_time_between_test).timeout
		_to_test.set_with_scene_ui2d(_scene_ui)
		await get_tree().create_timer(_time_between_test).timeout
	
