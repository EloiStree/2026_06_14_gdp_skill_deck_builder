class_name DeckBuildSetCardFacade
extends Node3D


signal on_title(text:String)
signal on_hint(text:String)
signal on_doc_url(url:String)
signal on_card_type(card_type:String)
signal on_display_set_with_text(display_text_image:String)



func set_title(text:String):
	on_title.emit(text)

func set_hint(text:String):
	on_hint.emit(text)
		
func set_doc_url(url:String):
	on_doc_url.emit(url)
	

func set_main_canvas_with_scene(scene:PackedScene):
	pass

func set_main_canvas_with_text(text:String):
	pass

func set_main_canvas_with_image(image:Image):
	pass

func set_card_type_from_text(card_id:String):
	on_card_type.emit(card_id)

func set_card_type_from_enum(type:DeckBuildUtility.CardType, number:DeckBuildUtility.CardNumber):
	var id:String= DeckBuildUtility.get_id_from(type,number)
	set_card_type_from_text(id)
	
func set_display_128x64_with_text(text:String):
	on_display_set_with_text.emit(text)

func set_display_128x64_with_bool_array(boolean:Array[bool]):
	var text:String =""
	for b in boolean:
		text+= "1" if b else "0"
	set_display_128x64_with_text(text)
	
	
	
	
