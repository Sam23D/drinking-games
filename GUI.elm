module GUI exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Cards exposing (..)
import KingsCup exposing (..)
import Actions exposing (..)


cardBackBlue1 : String
cardBackBlue1 =
    "Cards/cardBack_blue1.png"

cardBackBlue4 : String
cardBackBlue4 =
    "Cards/cardBack_blue4.png"


mainView : Model -> Html Actions
mainView model =
    div
        []
        [ h1 [] [ text <| titleForRule model.currentShowedCard ]
        , a [ onClick DrawCard ]
            [ faceUpCard model.currentShowedCard
            ]
        , p [] [ text <| descForRule model.currentShowedCard ]
        , div [ id "menu" ] [ menuContainer model ]
        ]


urlForCard : Card -> String
urlForCard card =
    "Cards/" ++ nameForCard card


menuContainer model =
    case model.menuDisplay of
        True ->
            div []
                [ button [ onClick ToggleMenu ] [ text "Close Menu" ]
                , menu model
                ]

        False ->
            button [ onClick ToggleMenu ] [ text "Open Menu" ]


menu model =
    div []
        [ ul []
            [ li [ class "listTitle" ] [ text "Juego" ]
            , li [] [ text "Reiniciar" ]
            , li [ class "listTitle" ] [ text "Reglas" ]
            , li [] [ text "Reiniciar" ]
            ]
        ]


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
