module Header.View exposing (view)


{-| Header.View

头部导航

-}


import Html as H        exposing (Html, div, text, h1, h2, a, ul, li, nav)
import Html.Events      exposing (onClick, onWithOptions)
import Html.Attributes  exposing (src, href)

import Nav.Link         exposing (link, slink)
import App.Msg          exposing (Msg(..))

import Routes.App       as App       exposing (..)
import Routes.Guide     as Guide     exposing (..)
import Routes.Component as Component exposing (..)


logo : Html Msg
logo =
    div []
        [ h1 []
              [ div []
                    [ link Home []
                          [ text "logo"
                          ]
                    ]
              ]
        ]


navigator : String -> Html Msg
navigator c =
    let
        linkto route str =
            slink route str 
    in
        ul []
            [ li [] [ linkto (Guide Design) "指南" ]
            , li [] [ linkto (Component Installation) "组件" ]
            , li [] [ linkto Resource "资源" ]
            ]
        

view : String -> Html Msg
view c =
    div []
        [ logo
        , nav [] [ navigator c ]
        ]
