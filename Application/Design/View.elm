module Design.View exposing (view)


{-| Design.View

设计原则

-}


import Html as H exposing (Html, div, text, h1, h2, a, ul, li, nav, strong, h3)
import App.Msg   exposing (Msg(..))

import Component.Layout.Layout exposing (..)
import Contents                exposing (..)


view : Html Msg
view =
    let
        title =
            Tuple.first design
    in
        div []
            [ h2 [] [ text title ]
            , row rowConfig []
                [ col (colConfig |> swap 3) [] [ text "1" ]
                , col (colConfig |> swap 3) [] [ text "2" ]
                , col (colConfig |> swap 3) [] [ text "3" ]
                , col (colConfig |> swap 3) [] [ text "4" ]
                ]
            , h3 [] [ text "一致性 Consistency" ]
            , ul []
                [ li []
                      [ strong [] [ text "与现实生活一致" ]
                      , text "与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念"
                      ]
                , li []
                    [ strong [] [ text "在界面中一致" ]
                    , text "所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等"
                  ]
                ]
            ]
    
