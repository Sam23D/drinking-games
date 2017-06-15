module Actions exposing (..)

import Cards exposing (Card)
import KingsCup exposing(Rule)

type alias Model = 
  { deck : List Card
  , currentShowedCard : Maybe Card
  , menuDisplay : Bool
  , ruleSet : List Rule
  }

type Actions
    = Nada
    | Shuffle
    | Shuffled (List Card)
    | DrawCard
    | ToggleMenu
