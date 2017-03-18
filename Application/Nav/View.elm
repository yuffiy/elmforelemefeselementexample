module Nav.View exposing (view)


{-| Nav.View

导航

-}


import Html as H        exposing (Html, div, text, h1, h2, a, ul, li, nav)
import App.Msg          exposing (Msg(..))





view : Html Msg
view =
    h1 [] [ text "Nav" ]
    
