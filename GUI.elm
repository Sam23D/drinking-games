module GUI exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Cards exposing (..)
import KingsCup exposing (..)


cardBackBlue1 = "Cards/cardBack_blue1.png"
cardBackBlue4 = "Cards/cardBack_blue4.png"

mainView : List Card -> Maybe Card -> msg -> Html msg
mainView deck card msg =
    div
        []
        [ h1 [] [ text <| titleForRule card ]
        , a [ onClick msg ] 
            [ faceUpCard card
            ]
        , p [] [ text <| descForRule card ]
        ]


urlForCard : Card -> String
urlForCard card =
    "Cards/" ++ nameForCard card


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
                [ img [ src cardBackBlue1 ] []
                ]

        _ ->
            div []
                [ img [ src cardBackBlue4 ] []
                ]


faceUpCard : Maybe Card -> Html msg
faceUpCard card =
    case card of
        Nothing ->
            div
                []
                [ img [ src cardBackBlue4 ] []
                ]

        Just card ->
            div
                []
                [ img [ src (urlForCard card) ] []
                ]


deckDisplay : deck -> Html msg
deckDisplay deck =
    div
        []
        [ div []
            [ img [ src cardBackBlue1 ] []
            ]
        , div [] []
        ]
