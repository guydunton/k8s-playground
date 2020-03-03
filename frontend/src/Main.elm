module Main exposing (main)

import Browser
import Html exposing (Html, button, div, h1, h2, hr, p, text)
import Html.Events exposing (onClick)
import Http exposing (get)


type alias Model =
    { greeting : Maybe String
    , goodbye : Maybe String
    , backendUrl : String
    }


type Msg
    = GetGreeting
    | GetGoodbye
    | GotGreeting (Result Http.Error String)
    | GotGoodbye (Result Http.Error String)


init : String -> ( Model, Cmd Msg )
init backendUrl =
    ( { greeting = Nothing
      , goodbye = Nothing
      , backendUrl = backendUrl
      }
    , Cmd.none
    )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Greeter" ]
        , div []
            [ h2 [] []
            , button [ onClick GetGreeting ] [ text "Get greeting" ]
            , p [] [ text (Maybe.withDefault "" model.greeting) ]
            ]
        , hr [] []
        , div []
            [ h2 [] []
            , button [ onClick GetGoodbye ] [ text "Get Goodbye" ]
            , p [] [ text (Maybe.withDefault "" model.goodbye) ]
            ]
        ]


getGreeting : String -> Cmd Msg
getGreeting url =
    Http.get
        { url = url ++ "/hi"
        , expect = Http.expectString GotGreeting
        }

getGoodbye : String -> Cmd Msg
getGoodbye url =
    Http.get
        { url = url ++ "/bye"
        , expect = Http.expectString GotGoodbye
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetGreeting ->
            ( model, getGreeting model.backendUrl )

        GetGoodbye ->
            ( model, getGoodbye model.backendUrl )

        GotGreeting maybeGreeting ->
            case maybeGreeting of
                Ok greeting ->
                    ( { model | greeting = Just greeting }, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        GotGoodbye maybeGoodbye ->
            case maybeGoodbye of
                Ok goodbye ->
                    ( { model | goodbye = Just goodbye }, Cmd.none )

                _ ->
                    ( model, Cmd.none )


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
