module Main exposing (..)

import Json.Decode exposing (Decoder, decodeString, (:=), object3, int, string, andThen, succeed, fail)
import Html exposing (Html, div, text, table, tr, td, th)
import Html.App as Html
import String exposing (toLower)

voterJson = """
{
  "name": "Jim",
  "age": 34,
  "party": "Republican"
}
"""

type Party = Republican | Democrat

type alias Voter =
  { name : String
  , age : Int
  , party : Party
  }

voterDecoder : Decoder Voter
voterDecoder =
  object3 Voter
    ("name" := string)
    ("age" := int)
    partyDecoder

partyDecoder : Decoder Party
partyDecoder =
  ("party" := string) `andThen` partyFromString

partyFromString : String -> Decoder Party
partyFromString party =
  case (toLower party) of
    "republican" ->
      succeed Republican
    "democrat" ->
      succeed Democrat
    _ ->
      fail (party ++ " is not a recognized party")


viewVoter voter =
  table []
    [ tr [] [ th [] [ text "Name" ], th [] [ text "Age" ], th [] [ text "Party" ] ]
    , tr [] [ td [] [ text voter.name ], td [] [ text (toString voter.age) ], td [] [ text (toString voter.party) ] ]
    ]

viewParseResult voterParseResult =
  case voterParseResult of
    Ok voter -> viewVoter voter
    Err error -> div [ ] [ text error ]

main = viewParseResult (decodeString voterDecoder voterJson)