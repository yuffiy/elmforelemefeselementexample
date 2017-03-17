module App.View exposing (view)

import Json.Decode exposing (succeed)
import Html exposing (Html, div, text, h1, a, ul, li, nav, header, section, footer, aside)
import Html.Events exposing (onClick, onWithOptions)
import Html.Attributes exposing (href)


import Routes.Routes as Routes exposing (Sitemap(..))
import Routes.Guide  as Guide
import Routes.Component as Component
import App.Model     exposing (Model)
import App.Msg       exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [] [ text "hello world"
           , nav_
           , content model
           ]



link : Sitemap -> List (Html Msg) -> Html Msg
link route children =
    let
        opts =
            { preventDefault = True
            , stopPropagation = True
            }
    in
        a [ href (Routes.toString route)
          , onWithOptions "click" opts (succeed <| RouteTo route)
          ]
        children        



nav_ : Html Msg
nav_ =
    ul []
        [ li [] [ link Routes.Home [ text "/home" ] ]
        , li [] [ link (Routes.Guide Guide.Design)  [ text "/guide/design" ] ]
        , li [] [ link (Routes.Guide Guide.Nav)  [ text "/guide/nav" ] ]
        , li [] [ link (Routes.Component Component.Installation)  [ text "/component/installation" ] ]
        , li [] [ link Routes.Resource  [ text "/resource" ] ]
        ]            
            


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


content : Model -> Html Msg
content ({ route } as model) =
    case route of
        Home ->
            home
        Guide s ->
            div [] [ text "2333" ]
        Component s ->
            div [] [ text "foobar" ]
        Resource ->
            resource
        NoMatch ->
            notMatch



guide : Html Msg
guide =
    h1 [] [ text "guide" ]                


home : Html Msg
home =
    h1 [] [ text "home" ]



navTopItem : Sitemap -> String -> Html Msg
navTopItem sitemap path =
    li [] [ link sitemap [ text path ]
          ]


logo : Html Msg
logo =
    h1 []
        [ link Home
              [ text "HOME"

              ]
        ]


navTop : Html Msg
navTop =
    nav []
        [ ul []
              [ navTopItem Home "home"
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
