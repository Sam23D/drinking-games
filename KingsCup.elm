module KingsCup exposing (..)

import Cards exposing (..)


type alias Rule =
    { card : Card
    , rule : String
    }

rulesKingsCup : List String
rulesKingsCup =
    [ "WATERFALL - Everyone chungs. You can stop when the person to your right stops, or just keep going!"
    , "KING'S CUP - Pour your drink into the cup. Last King drawn drinks the cup and ends the game!"
    , "QUESTION - take turns asking questions to each other quickly, first to pause or laught drinks"
    , "RULE - Make a rule. If someone breaks it at any time they must drink"
    , "SOCIAL - Cheers, everyone drinks"
    , "RHYME - You choose a word, Take turns saying rhyming words quickly. First to pause or miss drink"
    , "MATE - Choose a mate, This person will drink when you drink"
    , "THUMBMASTER - You are the thumb master. Place your thumb on the edge of the table at any time, everyone must too. Last person to do so drinks"
    , "DICKS - Dudes drink"
    , "SLAP - Last person to slap the table drink"
    , "WHORES - Chicks drink"
    , "ME - Take a drink"
    , "YOU - Give a drink"
    ]

showRule modelCard = 
  case modelCard of
      Nothing ->
          "No Rule"
      Just card ->
           ruleForNumber card kingsCupRuleSet



titleForRule : Maybe Card -> String
titleForRule card = 
    case String.split "-"  (showRule card) of
        title :: _ ->   
            title
        [] ->
            "Game Over"

descForRule : Maybe Card -> String
descForRule card = 
    case String.split "-"  (showRule card) of
        title :: desc :: _ -> 
            desc  
        _ ->   
            "No Desc"
            
allRulesForSuit suit ruleSet =
    List.map2 Rule (cardsOfSuit suit) ruleSet

allRules ruleSet =
    let
        allRules = (\ suits -> allRulesForSuit suits ruleSet )  
    in
        List.map allRules allCardSuits 
        |> List.concat

kingsCupRuleSet =
    allRules rulesKingsCup

allDrink =
    Rule { suit = Spades, number = Ace } "todos toman"


allHesDrink =
    Rule { suit = Hearts, number = Ace } "ello toman"


someDrink =
    Rule { suit = Spades, number = King } "todos toman"

cardNumEqualToRules : Card -> Rule -> Bool
cardNumEqualToRules card rule =
    card.number == rule.card.number


cardSuitEqualToRules : Card -> Rule -> Bool
cardSuitEqualToRules card rule =
    card.suit == rule.card.suit


ruleForNumber : Card -> List Rule -> String
ruleForNumber card ruleSet =
    case List.filter (cardNumEqualToRules card) ruleSet of
        [] ->
            "NO RULE"

        card :: _ ->
            card.rule


ruleForSuit : Card -> List Rule -> String
ruleForSuit card ruleSet =
    case List.filter (cardSuitEqualToRules card) ruleSet of
        [] ->
            "NO RULE"

        card :: _ ->
            card.rule
