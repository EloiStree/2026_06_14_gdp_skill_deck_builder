class_name DeckBuildSetCardFacade
extends Node3D


signal on_title(text:String)
signal on_doc_url(url:String)
signal on_card_type(card_type:String)
signal on_face_texture(texture:Texture2D)
signal on_back_text_to_display(text:String)
signal on_back_image_to_display(image:Image)
signal on_back_scene_to_display(scene:PackedScene)
signal on_open_url_requested()

func set_back_text_to_display(text:String):
	on_back_text_to_display.emit(text)
	
func set_back_image_to_display(image:Image):
	on_back_image_to_display.emit(image)
	
func set_back_scene_to_display(scene:PackedScene):
	on_back_scene_to_display.emit(scene)
	
func open_current_documentation_url_in_browser():
	on_open_url_requested.emit()
	
	
	

func set_face_texture(texture:Texture2D):
	on_face_texture.emit(texture)
	
func set_title(text:String):
	on_title.emit(text)

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
	


	
	
	
	
