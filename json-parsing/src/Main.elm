module Main exposing (..)

import Json.Decode exposing (Decoder, decodeString, (:=), object1, object7, int, string, float, bool, list, andThen, succeed, fail)
import Html exposing (Html, div, text, table, tr, td, th)
import String exposing (toLower)


voterJson : String
voterJson =
    """
{
  "name": "Jim",
  "age": 65,
  "height": 1.87,
  "address": {
    "line1": "123 Columbia Lane"
  },
  "children": ["Jane", "Jill"],
  "registered": true,
  "party": "Republican"
}
"""


type alias Voter =
    { name : String
    , age : Int
    , height : Float
    , address : Address
    , children : List String
    , registered : Bool
    , party : Party
    }


type Party
    = Republican
    | Democrat


type alias Address =
    { line1 : String
    }


voterDecoder : Decoder Voter
voterDecoder =
    object7 Voter
        ("name" := string)
        ("age" := int)
        ("height" := float)
        ("address" := addressDecoder)
        ("children" := (list string))
        ("registered" := bool)
        ("party" := partyDecoder)


addressDecoder : Decoder Address
addressDecoder =
    object1 Address ("line1" := string)


partyDecoder : Decoder Party
partyDecoder =
    string `andThen` partyFromString


partyFromString : String -> Decoder Party
partyFromString party =
    case (toLower party) of
        "republican" ->
            succeed Republican

        "democrat" ->
            succeed Democrat

        _ ->
            fail (party ++ " is not a recognized party")


viewVoter : Voter -> Html msg
viewVoter voter =
    table []
        [ tr []
            [ th [] [ text "Name" ]
            , th [] [ text "Age" ]
            , th [] [ text "Height" ]
            , th [] [ text "Address" ]
            , th [] [ text "Children" ]
            , th [] [ text "Registered?" ]
            , th [] [ text "Party" ]
            ]
        , tr []
            [ td [] [ text voter.name ]
            , td [] [ text (toString voter.age) ]
            , td [] [ text (toString voter.height) ]
            , td [] [ text voter.address.line1 ]
            , td [] [ text (toString voter.children) ]
            , td [] [ text (toString voter.registered) ]
            , td [] [ text (toString voter.party) ]
            ]
        ]


viewParseResult : Result String Voter -> Html a
viewParseResult voterParseResult =
    case voterParseResult of
        Ok voter ->
            viewVoter voter

        Err error ->
            div [] [ text error ]


main : Html msg
main =
    viewParseResult (decodeString voterDecoder voterJson)
