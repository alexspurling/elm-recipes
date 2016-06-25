module Main exposing (..)

import Json.Encode exposing (encode, Value, string, int, float, bool, list, object)
import Html exposing (Html, div, text, table, tr, td, th, textarea)
import Html.Attributes exposing (rows, cols)
import String exposing (toLower)


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

voter : Voter
voter =
    { name = "Jim"
    , age = 65
    , height = 2.3
    , address = { line1 = "123 Columbia Lane" }
    , children = ["Jane", "Jill"]
    , registered = True
    , party = Republican
    }


encodeVoter : Voter -> Value
encodeVoter voter =
    object
      [ ("name", string voter.name)
      , ("age", int voter.age)
      , ("height", float voter.height)
      , ("address", encodeAddress voter.address)
      , ("children", list (List.map string voter.children))
      , ("registered", bool voter.registered)
      , ("party", encodeParty voter.party)
      ]

encodeAddress : Address -> Value
encodeAddress address =
    object [("line1", string address.line1)]

encodeParty : Party -> Value
encodeParty party =
    case party of
        Republican -> string "Republican"
        Democrat -> string "Democrat"

voterToJson : Voter -> String
voterToJson voter =
  encode 2 (encodeVoter voter)

viewVoter : String -> Html msg
viewVoter voterJson =
    textarea [ rows 15, cols 40 ] [ text voterJson ]

main : Html msg
main =
    viewVoter (voterToJson voter)
