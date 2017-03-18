module Home.View exposing (view)


{-| Home.View

首页

-}


import Html exposing (Html, div, text, h1, h2, a, ul, li, nav, header, section, footer, aside)
import Html.Events exposing (onClick, onWithOptions)
import Html.Attributes exposing (href)

import Header.View as Header
import App.Msg     exposing (Msg(..))


banner : Html Msg
banner =
    div []
        [ h2 [] [ text "网站快速成型工具" ]
        ]


view : Html Msg
view =
    div []
        [ header []
              [ Header.view ""
              ]
        , section []
            [ banner
            ]
        , footer []
            []
        ]
