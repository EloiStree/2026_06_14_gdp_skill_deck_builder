class_name DeckBuildSubViewportToPng
extends Node

@export var subviewport: SubViewport


func export_png_in_user_image_png():
	export_png("user://image.png")

func export_png(path: String ) -> void:
	if subviewport == null:
		push_error("SubViewport is not assigned. Nothing to export.")
		return

	# Make sure the SubViewport has rendered at least once
	await RenderingServer.frame_post_draw

	var texture := subviewport.get_texture()
	if texture == null:
		push_error("SubViewport has no texture yet.")
		return

	var image: Image = texture.get_image()

	if image == null:
		push_error("Failed to retrieve image from SubViewport texture.")
		return

	var err := image.save_png(path)

	if err != OK:
		push_error("Failed to save PNG. Error code: %s" % err)
	else:
		print("Saved PNG to: ",ProjectSettings.globalize_path(path))
