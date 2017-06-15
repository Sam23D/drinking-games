import Html exposing(..)
import Html.Attributes exposing(..)
import Html.Events exposing(..)
import Debug exposing(..)
import Random

import GUI exposing(..)
import Cards exposing(..)
import KingsCup exposing(..)

main = 
    program 
    { init = init
    , view = view
    , subscriptions = subscriptions
    , update = update}

type alias Model = 
  { deck : List Card
  , currentShowedCard : Maybe Card
  }

globalModel : Model
globalModel = 
  { deck =  allCards 
  , currentShowedCard = Nothing
  }

init = ( globalModel , Random.generate Shuffled (shuffleDeck globalModel.deck))

type Actions 
    =   Nada
    |   Shuffle
    |   Shuffled (List Card)
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
        let
          shuffled = log "shuffled: " (shuffleDeck model.deck)

        in
          (model, Random.generate Shuffled shuffled)

      Shuffled newDeck->
        ({model | deck = newDeck }, Cmd.none)        
      

subscriptions model =
  Sub.none


view : Model -> Html Actions
view model =
  div [ ] 
    [ mainView model.deck model.currentShowedCard DrawCard
    
    ]

