class_name DeckBuildRelayDefaultCardResource
extends Node

signal on_relayed_card(card:DeckBuildDefaultCardResource)

@export var default_card:DeckBuildDefaultCardResource
@export var relay_at_start:bool=true

func _ready() -> void:
	if relay_at_start:
		set_and_relay_card(default_card)

func set_and_relay_card(default_card:DeckBuildDefaultCardResource):
		on_relayed_card.emit(default_card)
