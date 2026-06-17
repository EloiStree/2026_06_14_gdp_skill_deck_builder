class_name DeckBuildDefaultCardResource
extends Resource

@export_group("ID")
@export var _card_type:DeckBuildUtility.CardType
@export var _card_index:DeckBuildUtility.CardNumber

@export_group("Face")
@export var _face_title:String
@export var _face_documentation_url:String
@export var _face_image:Texture2D

@export_group("Back")
@export_multiline() var _back_rich_text:String
@export var _back_image:Texture2D
@export var _back_scene:PackedScene
