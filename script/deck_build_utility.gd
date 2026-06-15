class_name DeckBuildUtility
extends Resource

enum CardType{Heart,Diamond, Club,Spade}
enum CardColor{Black,Red}
enum CardNumber{A,V2,V3,V4,V5,V6,V7,V8,V9,V10,J,Q,K}


static func get_id_from(type:DeckBuildUtility.CardType, number:DeckBuildUtility.CardNumber)->String:
	var text:String =""
	match type:
		DeckBuildUtility.CardType.Heart:
			text+="H"
		DeckBuildUtility.CardType.Spade:
			text+="S"
		DeckBuildUtility.CardType.Club:
			text+="C"
		DeckBuildUtility.CardType.Diamond:
			text+="D"
	match number:
		DeckBuildUtility.CardNumber.A:
			text+="A"
		DeckBuildUtility.CardNumber.V2:
			text+="2"
		DeckBuildUtility.CardNumber.V3:
			text+="3"
		DeckBuildUtility.CardNumber.V4:
			text+="4"
		DeckBuildUtility.CardNumber.V5:
			text+="5"
		DeckBuildUtility.CardNumber.V6:
			text+="6"
		DeckBuildUtility.CardNumber.V7:
			text+="7"
		DeckBuildUtility.CardNumber.V8:
			text+="8"
		DeckBuildUtility.CardNumber.V9:
			text+="9"
		DeckBuildUtility.CardNumber.V10:
			text+="10"
		DeckBuildUtility.CardNumber.J:
			text+="J"
		DeckBuildUtility.CardNumber.Q:
			text+="Q"
		DeckBuildUtility.CardNumber.K:
			text+="K"
	return text
