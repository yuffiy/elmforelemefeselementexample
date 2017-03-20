module Header.View exposing (view)


{-| Header.View

头部导航

-}


import Html as H                     exposing (Html, div, text, h1, h2, a, ul, li, nav, header)
import Html.Events                   exposing (onClick, onWithOptions)
import Html.Attributes               exposing (src, href)
import Html.CssHelpers
import App.Stylesheets  as Style

import Nav.Link                      exposing (link, slink)
import App.Model                     exposing (Model)
import App.Msg                       exposing (Msg(..))

import Routes.App       as App       exposing (..)
import Routes.Guide     as Guide     exposing (..)
import Routes.Component as Component exposing (..)

import Component.Icon.Icon           exposing (config, color, size)
import Component.Icon.Element        exposing (element)
import Component.Color.Color as Color


{ class } =
    Html.CssHelpers.withNamespace "App"
        

logo : Html Msg
logo =
    h1 []
        [ div [ class [ Style.Logo ] ]
              [ link Home []
                    [ config |> color Color.white |> element 
                    ] 
              ]
        ]


navitem : App.Sitemap -> String -> App.Sitemap -> Html Msg
navitem r s cr =
    let
        acs =
            if toParent cr == toParent r then
                Style.NavItemActive
            else
                Style.NoOp
    in
        li [ class [ Style.NavItemContainer ]
       ]
    [ div [ class [ Style.NavItem, acs ]
          ]
          [ slink r s
          ]
    ]


navigator : String -> App.Sitemap -> Html Msg
navigator c r =
    ul [ class [ Style.NavContainer ]
       ]
    [ navitem (Guide Design) "指南" r
    , navitem (Component Installation) "组件" r
    , navitem Resource "资源" r
    ]
        

view : String -> Model -> Html Msg
view c m =
    header [ class [ Style.Header ] ]
        [ div [ class [ Style.HeaderContainer ]
              ]
              [ div [ class [ Style.HeaderLeftContainer ] ]
                [ logo
                ]
              , div [ class [ Style.HeaderRightContainer ] ]
                  [ nav [] [ navigator c m.route ]
                  , text "Style"
                  ]
              ]
        ]
