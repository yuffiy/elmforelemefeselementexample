module Home.View exposing (view)


{-| Home.View

首页

-}


import Html as H       exposing (Html, div, text, h1, h2, a, ul, li, nav, header, section, footer, aside)
import Html.Events     exposing (onClick, onWithOptions)
import Html.Attributes exposing (href)

import App.Model       exposing (Model)
import App.Msg         exposing (Msg(..))

import Header.View as Header



banner : Html Msg
banner =
    div []
        [ h2 [] [ text "网站快速成型工具" ]
        ]


view : Model -> Html Msg
view m =
    div []
        [ (Header.view "" m)
        , section []
            [ banner
            ]
        , footer []
            []
        ]
