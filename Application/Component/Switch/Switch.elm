module Component.Switch.Switch exposing (..)


{-| Switch


-}

    
import Html as H exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Mouse exposing (Position)
import Json.Decode as JD

import Html.CssHelpers
import Component.Switch.Stylesheets as Style

type alias Drag =
    { start : Int
    , curr  : Int
    }


type alias Model =
    { checked  : Bool
    , position : Int
    , drag     : Maybe Drag
    }


initModel : Model
initModel =
    { checked  = False
    , position = 0
    , drag     = Nothing
    }


getPosition : Model -> Int
getPosition { position, drag } =
    case drag of
        Nothing ->
            position
        Just { start, curr } ->
            let
                positionX =
                    position + curr - start
                    
                scopeVal =
                    clamp 0 24 positionX
            in
                scopeVal


type Msg
    = Change
    | MouseUp   Position
    | MouseMove Position
    | MouseDown Position


init : Model
init =
    initModel


update : Model -> Msg -> (Model, Cmd Msg)
update model msg =
    case msg of
        Change ->
            let
                _ =
                    Debug.log "model" model
            in
                ( { model | checked = not model.checked }
                , Cmd.none
                )
        MouseMove p ->
            let
                _ =
                    Debug.log "model" model
            in
                ( { model | drag = Maybe.map (\{ start } -> Drag start p.x) model.drag }
                , Cmd.none
                )
        MouseDown p ->
            ( { model | drag = Just <| Drag p.x p.x }
            , Cmd.none
            )
        MouseUp p ->
            ( { model | position = getPosition model, drag = Nothing }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions { drag } =
    case drag of
        Just _ ->
            Sub.batch
                [ Mouse.moves MouseMove
                , Mouse.ups MouseUp
                ]
        Nothing ->
            Sub.none
                

-- VIEW            

{ class } =
    Html.CssHelpers.withNamespace "Switch"        


view : Model -> Html Msg
view model =
    let
        (left, bgc, cursorbgc) =
            if model.checked then (0, "#efdfef", "#ae8cff") else (100, "#efefef", "#cccccc")
            
    in
        div [ class [ Style.Container ]
            , style [ ("backgroundColor", bgc) ]
            , onClick Change
            ]
        [ input [ type_ "checkbox"
                , checked model.checked
                , class [ Style.Element ]
                ] []
        , div [ class [ Style.Wrap ]
              ]
            [ div [ class [ Style.Cursor ]
                  , style [ ("left", (toString (getPosition model)) ++ "px")
                          , ("backgroundColor", cursorbgc)
                          ]
                  , on "mousedown" (JD.map MouseDown Mouse.position)
                  ]
                  []
            ]
        ]
