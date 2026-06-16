class_name DeckBuildSetMainCanvas
extends Node

@export var _control_scene:Control
@export var _scene_parent_node:Control


@export var _control_image:Control
@export var _texture_rect:TextureRect

@export var _control_rich_text:Control
@export var _rich_text:RichTextLabel

@export_group("Debug")
@export var _scene_created:Node


func disable_all():
	_control_scene.visible=false
	_control_image.visible=false
	_control_rich_text.visible=false
	if _scene_created:
		_scene_created.queue_free()


func set_with_rich_text(text:String):
	disable_all()
	_control_rich_text.visible=true
	_rich_text.text= text

func set_with_texture(image:Texture2D):
	disable_all()
	_control_image.visible=true
	_texture_rect.texture= image
	set_control_as_full(_texture_rect)
	
func set_control_as_full(target:Node):
	if target is Control:
		var c :Control = target
		c.set_anchors_preset(Control.PRESET_FULL_RECT)
		c.anchor_left = 0
		c.anchor_top = 0
		c.anchor_right = 1
		c.anchor_bottom = 1
		c.offset_left = 0
		c.offset_top = 0
		c.offset_right = 0
		c.offset_bottom = 0
	
func set_with_scene_ui2d(scene:PackedScene):
	disable_all()
	_control_scene.visible=true
	if _scene_created:
		_scene_created.queue_free()
		
	var created:Node = scene.instantiate()
	_scene_created=created
	_scene_parent_node.add_child(created)
	set_control_as_full(created)
