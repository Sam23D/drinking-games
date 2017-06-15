module Cards exposing (..)

import Maybe exposing(..)
import Random.List exposing(shuffle)

allCardNumbers : List CardNumber
allCardNumbers =
    [ Ace, King, Queen, Jack, Ten, Nine, Eight, Seven, Six, Five, Four, Three, Two ]


allCardSuits : List Suit
allCardSuits =
    [ Spades, Clubs, Diamonds, Hearts ]


type Suit
    = Spades
    | Clubs
    | Hearts
    | Diamonds


type CardNumber
    = Ace
    | King
    | Queen
    | Jack
    | Ten
    | Nine
    | Eight
    | Seven
    | Six
    | Five
    | Four
    | Three
    | Two


type alias Card =
    { suit : Suit
    , number : CardNumber
    }


type alias Deck =
    { cards : List Card
    , remaining : Int
    }


cardsOfSuit : Suit -> List Card
cardsOfSuit suit =
    List.map (Card suit) allCardNumbers


allCards : List Card
allCards =
    List.concat <|
        List.map cardsOfSuit allCardSuits


newDeckOfCards : Deck
newDeckOfCards =
    let
        currentAllCards =
            allCards

        deckSize =
            List.length currentAllCards
    in
        Deck currentAllCards deckSize

suitOf : Card -> Suit
suitOf card =
    card.suit

drawCard_ deck =
  let
    drawn = List.head deck
    remaining = withDefault [] (List.tail deck)
  in
    (drawn, remaining)

shuffleDeck deck =
    shuffle deck

sameNumber card1 card2 =
    card1.number == card2.number

sameSuit card1 card2 =
    card1.suit == card2.suit

