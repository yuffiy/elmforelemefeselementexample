module Design.View exposing (view)


{-| Design.View

设计原则

-}


import Html as H exposing (Html, div, text, h1, h2, a, ul, li, nav)
import App.Msg   exposing (Msg(..))

import Component.Layout.Layout exposing (..)


view : Html Msg
view =
    div []
        [ h2 [] [ text "设计原则" ]
        , row rowConfig []
            [ col (colConfig |> swap 3) [] [ text "1" ]
            , col (colConfig |> swap 3) [] [ text "2" ]
            , col (colConfig |> swap 3) [] [ text "3" ]
            , col (colConfig |> swap 3) [] [ text "4" ]
            ]
        ]
    
