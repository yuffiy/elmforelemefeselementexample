module Component.Icon.Loading exposing (loading, cloading)


{-| Loading icon

加载状态

@docs loading

-}


import Html exposing (Html, div)
import Html.Attributes exposing (style)
import Html.CssHelpers
import Svg exposing (Svg, svg, circle, animateTransform, animate)
import Svg.Attributes exposing (..)

import Component.Icon.Stylesheets as Style
import Component.Icon.Icon exposing (Config, defaultConfig)


{ class, classList } =
    Html.CssHelpers.withNamespace "Icon"


loadingSize : Float
loadingSize =
    64
 

animateCircularDuring : String
animateCircularDuring =
    "2s"


animateCircularView : Svg msg
animateCircularView =
    animateTransform [ attributeName "transform"
                     , type_ "rotate"
                     , begin "0s"
                     , from <| String.join " " ["0", toString loadingSize, toString loadingSize]
                     , to <| String.join " " ["360", toString loadingSize, toString loadingSize]
                     , dur animateCircularDuring
                     , fill "freeze"
                     , repeatCount "indefinite"
                     ] []

    
animateStrokeDashDuring : String
animateStrokeDashDuring =
    "1.5s"


animateStrokeDashKeyTimes : String
animateStrokeDashKeyTimes =
    "0;0.5;1"


animateAttrView : String -> String -> Svg msg
animateAttrView name valstr =
    animate [ attributeName name
            , begin "0s"
            , dur animateStrokeDashDuring
            , values valstr
            , keyTimes animateStrokeDashKeyTimes
            , fill "freeze"
            , repeatCount "indefinite"
            ] []


loading : Config -> Html msg
loading { color, size } =
    let
        viewbox =
            String.join " " << List.map toString
                <| [ loadingSize / 2
                   , loadingSize / 2
                   , loadingSize
                   , loadingSize
                   ]
        px s =
            toString s ++ "px"
    in
        div [ class [ Style.Icon ]
            ]
        [ svg [ viewBox viewbox
              , width  (px size)
              , height (px size)            
              ]
              [ circle [ cx <| toString loadingSize
                       , cy <| toString loadingSize
                       , r  "20"
                       , fill "none"
                       , strokeWidth "4"
                       , strokeLinecap "round"
                       , strokeDashoffset "0"
                       , strokeDasharray "90, 150"
                       , stroke color
                       ]
                    [ animateCircularView
                    , animateAttrView "stroke-dasharray" "1,200;90,150;90,150"
                    , animateAttrView "stroke-dashoffset" "0;-40;-120"
                    ]
              ]
        ]
              
              
cloading : Html msg
cloading =
    loading defaultConfig
