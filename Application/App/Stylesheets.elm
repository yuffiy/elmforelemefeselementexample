module App.Stylesheets exposing (..)


{-| App

App样式

-}


import Css           exposing (..)
import Css.Namespace exposing (namespace)

import Component.Color.Color as Color
import Component.Typo.Typo   as Typo


type CssClasses
    = Header
    | Aside
    | Main


css =
    (stylesheet << namespace "App")
    [ class Header
          [ position fixed
          , top zero
          , left zero
          , right zero
          ]
    , class Aside
          [ position fixed
          , top zero
          , left zero
          , bottom zero
          ]
    , class Main
          [ paddingTop (Css.rem 5)
          , paddingLeft (Css.rem 10)
          ]
    ]
