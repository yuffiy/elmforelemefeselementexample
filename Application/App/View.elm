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
import Routes.App       as App
import Routes.Guide     as Guide
import Routes.Component as Component

import Nav.Link exposing (link)

import App.Model        exposing (Model)
import App.Msg          exposing (Msg(..))

import Home.View as Home


import Component.Icon.Icon as Icon
import Component.Icon.Loading as Loading exposing (cloading)
import Component.Button.Button as Button


view : Model -> Html Msg
view model =
    div [] [ content model <| div [] []
           ]
    

content : Model -> Html Msg -> Html Msg
content ({ route } as model) =
    let
        rview =
            case route of
                App.Home ->
                    lazy <| always Home.view 
                App.NoMatch ->
                    lazy <| always Home.view
                _ ->
                    layout model
    in
        rview


layout : Model -> Html Msg -> Html Msg
layout ({ route } as model) children =
    div []
        [ header []
              [ -- nav_
              ]
        , section []
            [ children
            ]
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
        
        

-- nav_ : Html Msg
-- nav_ =
--     ul []
--         [ li [] [ link App.Home [] [ text "/home" ] ]
--         , li [] [ link (App.Guide Guide.Design) [] [ text "/guide/design" ] ]
--         , li [] [ link (App.Guide Guide.Nav) [] [ text "/guide/nav" ] ]
--         , li [] [ link (App.Component Component.Installation) [] [ text "/component/installation" ] ]
--         , li [] [ link App.Resource []  [ text "/resource" ] ]
--         ]
        



consoleContent : Model -> Html Msg
consoleContent { route } =
    let
      body_ =
          notMatch
    in
        div []
            [ topBar
            , aside [] []
            , section []
                [ body_
                ]
            ]


-- content : Model -> Html Msg
-- content ({ route } as model) =
--     case route of
--         App.Home ->
--             home
--         App.Guide s ->
--             div [] [ text "2333" ]
--         App.Component s ->
--             div [] [ text "foobar" ]
--         App.Resource ->
--             resource
--         App.NoMatch ->
--             notMatch



guide : Html Msg
guide =
    h1 [] [ text "guide" ]                

    



navTopItem : App.Sitemap -> String -> Html Msg
navTopItem sitemap path =
    li [] [ -- link sitemap [ text path ]
          ]


logo : Html Msg
logo =
    h1 []
        [ -- link App.Home
          --     [ text "HOME"

          --     ]
        ]


navTop : Html Msg
navTop =
    nav []
        [ ul []
              [ navTopItem App.Home "home"
              -- , navTopItem ResourceRoute "资源" 
              ]
        ]


topBar : Html Msg
topBar =
    header []
        [ div []
              [ logo
              , navTop
              ]
        ]
        


guideDesign : Html Msg
guideDesign =
    h1 [] [ text "GuideDesign" ]


guideNav : Html Msg
guideNav =
    h1 [] [ text "guideNav" ]


resource : Html Msg
resource =
    h1 [] [ text "resource" ]


notMatch : Html Msg
notMatch =
    h1 [] [ text "notMatch" ]        
