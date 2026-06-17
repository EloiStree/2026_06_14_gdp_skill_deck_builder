@tool
class_name DeckBuildSetNumberIcon
extends Node

@export var _editor_refresh:bool:
	set(value):
		_editor_refresh=value
		refresh_draw()

@export var _use_at_ready:bool=true
@export var _deck_number:DeckBuildUtility.CardNumber
@export var _deck_type:DeckBuildUtility.CardType
		
@export var _card_title:String="Title"
@export var _qr_code_url:String="https://github.com/EloiStree"

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
@export var _card_title_labels:Array[Label]
@export var _front_face_texture:TextureRect
@export var _number_labels:Array[Label]
@export var _number_texture:Array[TextureRect]
@export var _icon_labels:Array[Label]
@export var _icon_texture:Array[TextureRect]
@export var _qr_code_url_rect:Array[TextureRect]
@export var _qr_code_url_labels:Array[Label]


@export_group("Setup")
@export var _spare_texture:Texture2D
@export var _diamond_texture:Texture2D
@export var _club_texture:Texture2D
@export var _heart_texture:Texture2D
@export var _color_red:Color = Color.RED
@export var _color_black:Color= Color.BLACK

@export_group("Setup QJKA")
@export var _card_r0a:Texture2D
@export var _card_r02:Texture2D
@export var _card_r03:Texture2D
@export var _card_r04:Texture2D
@export var _card_r05:Texture2D
@export var _card_r06:Texture2D
@export var _card_r07:Texture2D
@export var _card_r08:Texture2D
@export var _card_r09:Texture2D
@export var _card_r10:Texture2D
@export var _card_rj:Texture2D
@export var _card_rq:Texture2D
@export var _card_rk:Texture2D
@export var _card_b0a:Texture2D
@export var _card_b02:Texture2D
@export var _card_b03:Texture2D
@export var _card_b04:Texture2D
@export var _card_b05:Texture2D
@export var _card_b06:Texture2D
@export var _card_b07:Texture2D
@export var _card_b08:Texture2D
@export var _card_b09:Texture2D
@export var _card_b10:Texture2D
@export var _card_bj:Texture2D
@export var _card_bq:Texture2D
@export var _card_bk:Texture2D



func _ready() -> void:
	if _use_at_ready:
		set_full_with_enum(_deck_type, _deck_number)
		set_qr_code_url(_qr_code_url)
		
		
func set_front_face_texture(image:Texture2D):
	_last_given_texture=image
	_front_face_texture.texture=image
	


func set_qr_code_url(url:String):
	_qr_code_url =url
	var builder = DeckBuildQrCode.new()
	var image :=builder.get_texture(url)
	for t in _qr_code_url_rect:
		if t:
			t.texture= image
	for t in _qr_code_url_labels:
		if t:
			t.text= url


func set_title(text:String):
	for t in _card_title_labels:
		if t:
			t.text=text
			

	

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


		

func refresh_draw():
	set_image_with_texture(_deck_type)
	set_qr_code_url(_qr_code_url)
	set_title(_card_title)
	set_full_with_enum(_deck_type,_deck_number)

func open_url_in_browser_from_inspector():
	OS.shell_open(_qr_code_url)

func set_card_type_from_text(text:String):
	text =text.to_upper()
	
	var type:DeckBuildUtility.CardType
	var number:DeckBuildUtility.CardNumber
	if text.length()<2:
		return
	
	
	if text[0]=="H":
		type= DeckBuildUtility.CardType.Heart
	elif text[0]=="D":
		type= DeckBuildUtility.CardType.Diamond
	elif text[0]=="C":
		type= DeckBuildUtility.CardType.Club
	elif text[0]=="S":
		type= DeckBuildUtility.CardType.Spade
	
	if text.length()==3:
		number=DeckBuildUtility.CardNumber.V10

	if text.length()==2:
		var c_type:String = text[1]
		match  c_type:
			"A":
				number=DeckBuildUtility.CardNumber.A
			"1":
				number=DeckBuildUtility.CardNumber.A
			"J":
				number=DeckBuildUtility.CardNumber.J
			"Q":
				number=DeckBuildUtility.CardNumber.Q
			"K":
				number=DeckBuildUtility.CardNumber.K
			"2":
				number=DeckBuildUtility.CardNumber.V2
			"3":
				number=DeckBuildUtility.CardNumber.V3
			"4":
				number=DeckBuildUtility.CardNumber.V4
			"5":
				number=DeckBuildUtility.CardNumber.V5
			"6":
				number=DeckBuildUtility.CardNumber.V6
			"7":
				number=DeckBuildUtility.CardNumber.V7
			"8":
				number=DeckBuildUtility.CardNumber.V8
			"9":
				number=DeckBuildUtility.CardNumber.V9
	set_full_with_enum(type,number)


func is_red():
	return _deck_type==DeckBuildUtility.CardType.Heart or _deck_type==DeckBuildUtility.CardType.Diamond
func is_black():
	return _deck_type==DeckBuildUtility.CardType.Club or _deck_type==DeckBuildUtility.CardType.Spade

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
	set_image_with_texture(type)
	

func set_number_with_texture(image :Texture2D):
	for t in _number_texture:	
		if t:
			t.texture = image
	

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
	_deck_type=DeckBuildUtility.CardType.Heart
	

func set_as_diamond():
	_deck_type=DeckBuildUtility.CardType.Diamond
	set_icon("♦")
	set_color_red()
	
func set_as_spade():
	_deck_type=DeckBuildUtility.CardType.Spade
	set_icon("♠")
	set_color_black()
	
func set_as_club():
	_deck_type=DeckBuildUtility.CardType.Club
	set_icon("♣")
	set_color_black()
	

func set_id_1():
	set_number("1")
	set_number_with_texture(_card_r0a if is_red() else _card_b0a)
		
func set_id_2():
	set_number("2")
	set_number_with_texture(_card_r02 if is_red() else _card_b02)
func set_id_3():
	set_number("3")
	set_number_with_texture(_card_r03 if is_red() else _card_b03)
func set_id_4():
	set_number("4")
	set_number_with_texture(_card_r04 if is_red() else _card_b04)
func set_id_5():
	set_number("5")
	set_number_with_texture(_card_r05 if is_red() else _card_b05)
func set_id_6():
	set_number("6")
	set_number_with_texture(_card_r06 if is_red() else _card_b06)
func set_id_7():
	set_number("7")
	set_number_with_texture(_card_r07 if is_red() else _card_b07)
func set_id_8():
	set_number("8")
	set_number_with_texture(_card_r08 if is_red() else _card_b08)
func set_id_9():
	set_number("9")		
	set_number_with_texture(_card_r09 if is_red() else _card_b09)
func set_id_10():
	set_number("10")	
	set_number_with_texture(_card_r10 if is_red() else _card_b10)	
func set_id_a():
	set_number("a")		
	set_number_with_texture(_card_r0a if is_red() else _card_b0a)
func set_id_k():
	set_number("k")		
	set_number_with_texture(_card_rk if is_red() else _card_bk)
func set_id_q():
	set_number("q")		
	set_number_with_texture(_card_rq if is_red() else _card_bq)
func set_id_j():
	set_number("j")		
	set_number_with_texture(_card_rj if is_red() else _card_bj)

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
			
	
	
