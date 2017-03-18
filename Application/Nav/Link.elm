module Nav.Link exposing (link, slink)

{-| Link

链接按钮

e.g. 跳转到首页

link Home [] [ text "Home" ] 

-}


import Html              exposing (Html, Attribute, a, text)
import Html.Events       exposing (onClick, onWithOptions)
import Html.Attributes   exposing (href)
import Json.Decode       exposing (succeed)

import App.Msg           exposing (Msg(..))
import Routes.App as App exposing (Sitemap)


link : Sitemap -> List (Attribute Msg) -> List (Html Msg) -> Html Msg
link route attrs children =
    let
        opts =
            { preventDefault = True
            , stopPropagation = True
            }

        props =
            [ href (App.toString route)
            , onWithOptions "click" opts (succeed <| RouteTo route)
            ] ++ attrs
    in
        a props children


slink : Sitemap -> String -> Html Msg
slink route str =
    link route [] [ text str ]
