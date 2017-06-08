module GUI exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Cards exposing (..)


topMenu : List Card -> Html msg
topMenu deck =
    div
        []
        [ h1 [] [ text "Kings Cup" ]
        , deckFaceDown deck
        , button [] [ text "Configuration" ]
        ]

urlForCard : Card -> String
urlForCard card =
    "/Cards/" ++ nameForCard card

nameForCard : Card -> String
nameForCard card = 
    "card" ++ suitNameForCard card ++ numberNameForCard card ++ ".png" 

suitNameForCard : Card -> String
suitNameForCard card =
    case suitOf card of
        Spades ->
            "Spades"

        Clubs ->
            "Clubs"

        Hearts ->
            "Hearts"

        Diamonds ->
            "Diamonds"


numberNameForCard : Card -> String
numberNameForCard card =
    case card.number of
        Ace ->
            "A"

        King ->
            "K"

        Queen ->
            "Q"

        Jack ->
            "J"

        Ten ->
            "10"

        Nine ->
            "9"

        Eight ->
            "8"

        Seven ->
            "7"

        Six ->
            "6"

        Five ->
            "5"

        Four ->
            "4"

        Three ->
            "3"

        Two ->
            "2"

deckFaceDown : List Card -> Html msg
deckFaceDown deck =
    case deck of
        [] ->
            div []
            [ img [ src "/Cards/cardBack_blue1.png" ] []
            ]
        _ ->
            div []
            [ img [ src "/Cards/cardBack_blue4.png" ] []
            ]

deckDisplay : deck -> Html msg
deckDisplay deck =
    div
        []
        [ div []
            [ img [ src "/Cards/cardBack_blue1.png" ] []
            ]
        , div [] []
        ]
