module Header.View exposing (view)


{-| Header.View

头部导航

-}


import Html as H        exposing (Html, div, text, h1, h2, a, ul, li, nav)
import Html.Events      exposing (onClick, onWithOptions)
import Html.Attributes  exposing (src, href)

import Routes.Routes    as Routes
import Routes.App       as App exposing (..)
import Routes.Guide     as Guide
import Routes.Component as Component

import Nav.Link         exposing (slink)
import App.Msg          exposing (Msg(..))

logo : Html Msg
logo =
    div []
        [ h1 []
              [ div [] [ text "logo" ]
              ]
        ]


navigator : String -> Html Msg
navigator c =
    let
        linkto route str =
            slink route str 
    in
        ul []
            [ li [] [ linkto App.Home "/home" ]
            , li [] [ linkto (App.Guide Guide.Design) "/guide/design" ]
            , li [] [ linkto (App.Guide Guide.Nav) "/guide/nav" ]
            , li [] [ linkto (App.Component Component.Installation) "/component/installation" ]
            , li [] [ linkto App.Resource "/resource" ]
            ]        
        

view : String -> Html Msg
view c =
    div []
        [ logo
        , nav [] [ navigator c ]
        ]
