@tool
class_name DeckBuildSetTexture128x64
extends Node

signal on_texture_material_updated(index:int, material_surface:Material)
signal on_texture_updated(texture: Texture2D)

@export var color_on: Color = Color("232323ff")
@export var color_off: Color = Color( "ff8833ff")

const SCREEN_WIDTH: int = 128
const SCREEN_HEIGHT: int = 64
const SCREEN_SIZE: int = SCREEN_WIDTH * SCREEN_HEIGHT
const SCREEN_SIZE_INDEX_MAX: int = SCREEN_SIZE - 1

var texture_2d: Texture2D


@export var use_mipmaps: bool = false
@export var material_to_duplicate: StandardMaterial3D
@export var material_duplicated: StandardMaterial3D



var is_init=false
func _ready() -> void:
	if is_init==false:
		_setup_the_texture_check()


func _setup_the_texture_check():
	if is_init:
		return
	is_init=true

	material_duplicated = material_to_duplicate.duplicate() as StandardMaterial3D
	var image = Image.create(SCREEN_WIDTH, SCREEN_HEIGHT, false, Image.FORMAT_RGB8)
	texture_2d = ImageTexture.create_from_image(image)
	material_duplicated.albedo_texture = texture_2d
	
	


func set_with_text_image_10(text_of_1_and_0:String):
	push_error("To ADD")
	pass

func set_with_text_b58(text_of_1_and_0:String):
	push_error("To ADD")
	pass



func set_with_texture(texture:Texture2D):
	texture_2d = texture
	on_texture_updated.emit(texture)
	on_texture_material_updated.emit(0,material_duplicated)

func set_to_random():
	_setup_the_texture_check()
	var array:Array[bool]=[]
	array.resize(128*64)
	for i in range(SCREEN_SIZE):
		array[i] = randf()>0.5
	set_texture_with_boolean_array(array)
	

func set_boolean_array_to_full():
	_setup_the_texture_check()
	var array:Array[bool]=[]
	array.resize(128*64)
	array.fill(true)
	set_texture_with_boolean_array(array)
	

func set_boolean_array_to_clear():
	_setup_the_texture_check()
	var array:Array[bool]=[]
	array.resize(128*64)
	array.fill(false)
	set_texture_with_boolean_array(array)


func get_on_off_color(is_on: bool) -> Color:
	return color_on if is_on else color_off


func set_color_on_off(new_true_color:Color,new_false_color:Color):
		color_on =new_true_color
		color_off =new_false_color
		
func set_color_on(new_true_color:Color):
	color_on =new_true_color
	
func set_color_off(new_false_color:Color):
	color_off =new_false_color
func set_texture_with_boolean_array(display_as_boolean_array: Array[bool]):
	if display_as_boolean_array==null:
		return 
	if display_as_boolean_array.size()<SCREEN_SIZE:
		return 
	_setup_the_texture_check()
	var image = Image.create(SCREEN_WIDTH, SCREEN_HEIGHT, false, Image.FORMAT_RGB8)
	for i in range(SCREEN_SIZE):
		var pos := index_to_xy(i)
		var is_on: bool = display_as_boolean_array[i]
		var color = get_on_off_color(is_on)
		image.set_pixel(pos.x, pos.y, color)
		
	texture_2d = ImageTexture.create_from_image(image)
	on_texture_updated.emit(texture_2d)
	on_texture_material_updated.emit(0, material_duplicated)

func set_texture_with_bit_array(bit_pack_as_bytes:PackedByteArray):
	_setup_the_texture_check()
	# expects width * height bits, packed as bytes (8 bits per byte)
	var total_bits = bit_pack_as_bytes.size() * 8
	var max_size = min(total_bits, SCREEN_SIZE)
	var result_array: Array[bool] = []
	
	for i in range(max_size):
		var byte_index = i / 8
		var bit_index = i % 8
		var is_on: bool = (bit_pack_as_bytes[byte_index] & (1 << bit_index)) != 0
		result_array.append(is_on)
	
	set_texture_with_boolean_array(result_array)
		
func index_to_xy(index: int) -> Vector2i:
	var x: int = index % SCREEN_WIDTH
	var y: int = index / SCREEN_WIDTH
	return Vector2i(x, y)

func xy_to_index(x: int, y: int) -> int:
	return y * SCREEN_WIDTH + x
