@tool
class_name DeckBuildSetNumberIcon
extends Node

@export var _editor_refresh:bool:
	set(value):
		_editor_refresh=value
		refresh_draw()

@export var _use_at_ready:bool=true
@export var _deck_number:DeckBuildUtility.CardNumber:
	set(value):
		_deck_number=value
		refresh_draw()
		
@export var _deck_type:DeckBuildUtility.CardType:
	set(value):
		_deck_type=value
		refresh_draw()
		
@export var _card_title:String="Title"
@export var _qr_code_url:String="https://github.com/EloiStree"

@export_multiline()
var _main_text_rich:String
@export_multiline()
var _hint_text_rich:String
@export_multiline()
var _bbcode_reminder:String="""
[b]Bold[/b] [i]Italic[/i] [u]Underline[/u]
[s]Strikethrough[/s] [color=#ff0000]Red[/color]
[font_size=24]Large text[/font_size]
[center]Centered text[/center]
[right]Right aligned[/right]
[fill]Justified text[/fill]
[url]https://godotengine.org[/url]
[img=64x64]res://icon.svg[/img]
[img]res://icon.svg[/img]
[code]print("Hello")[/code]
[codeblock]
func _ready():
	print("Hello")
[/codeblock]

[table=2]
	[cell]Name[/cell]
	[cell]Score[/cell]

	[cell]Alice[/cell]
	[cell]100[/cell]

	[cell]Bob[/cell]
	[cell]75[/cell]
[/table]

[list]
	[*]Item 1
	[*]Item 2
	[*]Item 3
[/list]
"""

@export var _last_given_texture:Texture2D



@export_group("UI")
@export var _number_labels:Array[Label]
@export var _icon_labels:Array[Label]
@export var _card_id_labels:Array[Label]
@export var _card_title_labels:Array[Label]
@export var _icon_texture:Array[TextureRect]
@export var _qr_code_url_rect:Array[TextureRect]
@export var _qr_code_url_labels:Array[Label]
@export var _main_text_rich_label:RichTextLabel
@export var _hint_text_rich_label:RichTextLabel
@export var _display_128x64:TextureRect

@export_group("Setup")
@export var _spare_texture:Texture2D
@export var _diamond_texture:Texture2D
@export var _club_texture:Texture2D
@export var _heart_texture:Texture2D
@export var _color_red:Color = Color.RED
@export var _color_black:Color= Color.BLACK


func set_hint_text(text:String):
	_hint_text_rich=text
	if _hint_text_rich_label:
		_hint_text_rich_label.text= text
		
func set_main_text(text:String):
	_main_text_rich=text
	if _main_text_rich_label:
		_main_text_rich_label.text= text

func set_qr_code_text(text:String):
	_qr_code_url =text
	var builder = DeckBuildQrCode.new()
	var image :=builder.get_texture(text)
	for t in _qr_code_url_rect:
		if t:
			t.texture= image
	for t in _qr_code_url_labels:
		if t:
			t.text= text

func _ready() -> void:
	if _use_at_ready:
		set_full_with_enum(_deck_type, _deck_number)
		set_qr_code_text(_qr_code_url)
		
func set_title(text:String):
	for t in _card_title_labels:
		if t:
			t.text=text
			
func set_texture_mini_screen(texture:Texture2D):
	_last_given_texture=texture
	if texture:
		_display_128x64.texture=texture
	

func set_image_with_texture(type:DeckBuildUtility.CardType):
	for t in _icon_texture:
		if t:
			if type==DeckBuildUtility.CardType.Heart:
				t.texture = _heart_texture
			elif type==DeckBuildUtility.CardType.Spade:
				t.texture = _spare_texture
			elif type==DeckBuildUtility.CardType.Diamond:
				t.texture = _diamond_texture
			elif type==DeckBuildUtility.CardType.Club:
				t.texture = _club_texture

func set_card_id(type:DeckBuildUtility.CardType, number:DeckBuildUtility.CardNumber):
	var id:String = DeckBuildUtility.get_id_from(type,number)
	for t in _card_id_labels:
		if t:
			t.text= id
		

func refresh_draw():
	set_card_id(_deck_type, _deck_number)
	set_image_with_texture(_deck_type)
	set_qr_code_text(_qr_code_url)
	set_title(_card_title)
	set_hint_text(_hint_text_rich) 
	set_main_text(_main_text_rich)
	set_texture_mini_screen(_last_given_texture)


func set_full_with_enum( type:DeckBuildUtility.CardType, number:DeckBuildUtility.CardNumber)->void:
	
	match type:
		DeckBuildUtility.CardType.Heart:
			set_as_heart()
		DeckBuildUtility.CardType.Diamond:
			set_as_diamond()
		DeckBuildUtility.CardType.Spade:
			set_as_spade()
		DeckBuildUtility.CardType.Club:
			set_as_club()
			
	match number:
		DeckBuildUtility.CardNumber.A:
			set_id_a()
		DeckBuildUtility.CardNumber.V2:
			set_id_2()
		DeckBuildUtility.CardNumber.V3:
			set_id_3()
		DeckBuildUtility.CardNumber.V4:
			set_id_4()
		DeckBuildUtility.CardNumber.V5:
			set_id_5()
		DeckBuildUtility.CardNumber.V6:
			set_id_6()
		DeckBuildUtility.CardNumber.V7:
			set_id_7()
		DeckBuildUtility.CardNumber.V8:
			set_id_8()
		DeckBuildUtility.CardNumber.V9:
			set_id_9()
		DeckBuildUtility.CardNumber.V10:
			set_id_10()
		DeckBuildUtility.CardNumber.J:
			set_id_j()
		DeckBuildUtility.CardNumber.Q:
			set_id_q()
		DeckBuildUtility.CardNumber.K:
			set_id_k()
		

func set_number(text:String):
	for t in _number_labels:	
		if t:
			t.text = text
		
func set_icon(text:String):
	for t in _icon_labels:	
		if t:
			t.text = text
		
func set_color_red():
	set_color(_color_red)

func set_color_black():
	set_color(_color_black)
	
func set_color(color:Color):
	for t in _number_labels:	
		if t:
			t.label_settings.font_color=color
	for t in _icon_labels:	
		if t:
			t.label_settings.font_color=color
		
func set_as_heart():
	set_icon("♥")
	set_color_red()

func set_as_diamond():
	set_icon("♦")
	set_color_red()
	
func set_as_spade():
	set_icon("♠")
	set_color_black()
	
func set_as_club():
	set_icon("♣")
	set_color_black()
	

func set_id_1():
	set_number("1")
func set_id_2():
	set_number("2")
func set_id_3():
	set_number("3")
func set_id_4():
	set_number("4")
func set_id_5():
	set_number("5")
func set_id_6():
	set_number("6")
func set_id_7():
	set_number("7")
func set_id_8():
	set_number("8")
func set_id_9():
	set_number("9")		
func set_id_10():
	set_number("10")		
func set_id_a():
	set_number("a")		
func set_id_k():
	set_number("k")		
func set_id_q():
	set_number("q")		
func set_id_j():
	set_number("j")		

func set_from_icon_index(index:int):
	match index:
		1:
			set_id_a()
		2-10:
			set_number(str(index))
		11:
			set_id_j() 
		12:
			set_id_q() 
		13:
			set_id_k() 
			
	
	
