module Make exposing (..)

import Char
import Html.App
import Html exposing (Html, Attribute, div, input, button, text, br)
import Html.Events exposing (onClick)
import Random exposing (andThen)
import String


main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { randomBoolean : Bool
    , randomInt : Int
    , randomString : String
    , randomList : List String
    }


init : ( Model, Cmd Msg )
init =
    ( { randomBoolean = False
      , randomInt = 0
      , randomString = "Initial string"
      , randomList = []
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = GetRandomValues
    | NewRandomValues Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetRandomValues ->
            ( model, Random.generate NewRandomValues randomValueGenerator )

        NewRandomValues randomModel ->
            ( randomModel, Cmd.none )


randomValueGenerator : Random.Generator Model
randomValueGenerator =
    Random.map4 Model
        --Model is the function that takes 4 arguments of random values and produces a Model value
        Random.bool
        (Random.int Random.minInt Random.maxInt)
        randomWord
        (Random.list 5 randomWord)


randomWord : Random.Generator String
randomWord =
  (Random.int 0 10) --Random word length
    `Random.andThen`
      (\length ->
        Random.map2 toWord
          uppercaseLetter --First character
          (Random.list length lowercaseLetter) --Remaining characters
      )


uppercaseLetter : Random.Generator Char
uppercaseLetter =
    Random.map (\n -> Char.fromCode (n + 65)) (Random.int 0 25)


lowercaseLetter : Random.Generator Char
lowercaseLetter =
    Random.map (\n -> Char.fromCode (n + 97)) (Random.int 0 25)


toWord : Char -> List Char -> String
toWord firstLetter remainingLetters =
    String.fromList (firstLetter :: remainingLetters)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ text ("Random boolean: " ++ (toString model.randomBoolean))
            , br [] []
            , text ("Random int: " ++ (toString model.randomInt))
            , br [] []
            , text ("Random string: " ++ (toString model.randomString))
            , br [] []
            , text ("Random list: " ++ (toString model.randomList))
            , br [] []
            ]
        , button [ onClick GetRandomValues ] [ text "Get random values" ]
        ]
