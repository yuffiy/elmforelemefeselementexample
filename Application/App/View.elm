module App.View exposing (view)


{-| App.View

App 主视图

-}


import Json.Decode exposing (succeed)
import Html exposing (Html, div, text, h1, a, ul, li, nav, header, section, footer, aside)
import Html.Events exposing (onClick, onWithOptions)
import Html.Attributes exposing (href)
import Html.Lazy exposing (lazy)
import Html.CssHelpers
import App.Stylesheets as Style

import Routes.Routes    as Routes
import Routes.App       as App exposing (..)
import Routes.Guide     as Guide exposing (..)
import Routes.Component as Component

import Nav.Link exposing (link, slink)

import App.Model        exposing (Model)
import App.Msg          exposing (Msg(..))


import Home.View as Home
import Header.View as Header
import Design.View as Design
import Nav.View    as Nav


import Component.Icon.Icon as Icon
import Component.Icon.Loading as Loading exposing (cloading)
import Component.Button.Button as Button


{ class } =
    Html.CssHelpers.withNamespace "App"


view : Model -> Html Msg
view ({ route } as model) =
    let
        children =
            case route of
                Home ->
                    Nothing
                NoMatch ->
                    Nothing
                _ ->
                    Just route
    in
        div [ class [ Style.Container
                    ]
            ]
        [ content model children
        ]
    

content : Model -> Maybe App.Sitemap -> Html Msg
content m s =
    case s of
        Just r ->
            layout m r
        Nothing ->
            Home.view m



asideNav : List (App.Sitemap, String) -> App.Sitemap -> Html Msg
asideNav l cr =
    let
        item (r, s) =
            let
                acs =
                    if cr == r then
                        Style.AsideNavItemActive
                    else
                        Style.NoOp
            in
                li [ class [ Style.AsideNavItem, acs ] ]
                    [ slink r s ]
    in
        aside [ class [ Style.Aside ] ]
            [ nav []
                  [ ul [] (List.map item l) 
                  ]
            ]


layout : Model -> App.Sitemap -> Html Msg
layout m r =
    let
        asidec =
            aside [ class [ Style.Aside
                          ]
                  ]


        mainc =
            section [ class [ Style.Main
                            ]
                    ]

        
        ( aside_, body_ ) =
            case r of
                Guide sr ->
                    let
                        nav_ : Html Msg
                        nav_ =
                            asideNav [ ( Guide Design , "设计原则" )
                                     , ( Guide Nav, "导航" )
                                     ] m.route
                            
                        view_ : Html Msg
                        view_ =
                            case sr of
                                Design ->
                                    Design.view
                                Nav ->
                                    Nav.view
                    in
                        ( nav_ :: [], (mainc [ view_ ]) :: [] )
                Component sr ->
                    ( [], [] )
                _ ->
                    ( [], [] )
    in        
        div [ class [ Style.Container ] ]
            [ (Header.view "" m)  
            , section [ class [ Style.MainContainer ]
                      ]
                  (aside_ ++ body_)
            , footer []
                []
            ]

        -- [ h1 [] [ text "home" ]
        -- , cloading
        -- , 
        -- , Button.primary []
        --     [ Loading.loading (Icon.config "#FFFFFF" 16)
        --     , text " 加载中"
        --     ]
        -- ]

