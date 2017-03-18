module App.View exposing (view)


{-| App.View

App 主视图

-}


import Json.Decode exposing (succeed)
import Html exposing (Html, div, text, h1, a, ul, li, nav, header, section, footer, aside)
import Html.Events exposing (onClick, onWithOptions)
import Html.Attributes exposing (href)
import Html.Lazy exposing (lazy)

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
        div [] [ content children
               ]
    

content : Maybe App.Sitemap -> Html Msg
content s =
    case s of
        Just r ->
            layout r
        Nothing ->
            Home.view


layout : App.Sitemap -> Html Msg
layout r =
    let
        ( aside, body_ ) =
            case r of
                Guide sr ->
                    let
                        nav_ : Html Msg
                        nav_ =
                            ul []
                                [ li [] [ slink (Guide Design) "设计原则" ]
                                , li [] [ slink (Guide Nav) "导航" ]
                                ]

                        view_ : Html Msg
                        view_ =
                            case sr of
                                Design ->
                                    Design.view
                                Nav ->
                                    Nav.view
                    in
                        ( nav_ :: [], view_ :: [] )
                Component sr ->
                    ( [], [ Design.view ] )
                _ ->
                    ( [], [] )
    in        
        div []
            [ header []
                  [ Header.view ""
                  ]
            , section [] (aside ++ body_)
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
