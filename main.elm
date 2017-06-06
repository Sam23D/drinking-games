import Html exposing(..)
import Html.Attributes exposing(..)
import Html.Events exposing(..)
import Debug exposing(..)

import Cartas exposing(..)

main = 
    program 
    { init = init
    , view = view
    , subscriptions = subscriptions
    , update = update}

globalModel = 
  { deck =  allCards 
  , currentShowedCard = Nothing
  }

init = ( globalModel , Cmd.none)

type Actions 
    =   Nada
    |   Shuffle
    |   DrawCard


update msg model = 
    case msg of
      Nada ->
        ( model , Cmd.none)
      DrawCard ->
        let
            (card, remaining) = (drawCard_ model.deck)
        in
          ( {model | currentShowedCard = card, deck = remaining } , Cmd.none)

      Shuffle ->
        (model, Cmd.none)        
          

shuffleDeck deck =
  deck


subscriptions model =
  Sub.none

view model =
  div [ ] 
    [ p [ ][ text <| "Current: " ++ ( toString model.currentShowedCard ) ]
    , button[ onClick DrawCard ][ text "draw card" ]
    , p [ ][ text <| "Remaining: " ++ (toString model.deck) ]
    
    ]

