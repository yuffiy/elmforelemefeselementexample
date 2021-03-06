module Component.Button.Stylesheets exposing (..)


import Css           exposing (..)
import Css.Namespace exposing (namespace)

import Component.Color.Color as Color
import Component.Typo.Typo   as Typo


type CssClasses
    = NoOp
    | ThemeDefault
    | ThemePrimary
    | ThemeText
    | ThemeSuccess
    | ThemeWarning
    | ThemeDanger
    | ThemeDefaultHover
    | ThemePrimaryHover


css =
    (stylesheet << namespace "Button")
    [ class ThemeDefault
          [ display inlineBlock
          , lineHeight (int 1)
          , whiteSpace noWrap
          , cursor pointer
          , backgroundColor (hex Color.white)
          , color (hex Color.black)
          , outline zero
          , padding2 (px 10) (px 15)
          , margin (px 0)
          , borderRadius (px 4)
          , fontSize (px Typo.small)
          , border3 (px 1) solid (hex "#BFCBD9")
          , hover
                [ borderColor (hex Color.blue)
                , color (hex Color.blue)
                ]
          ]
    , class ThemePrimary
        [ backgroundColor (hex Color.blue)
        , borderColor (hex Color.blue)
        , color (hex Color.white)
        , hover
              [ backgroundColor (hex "#4db3ff")
              , borderColor (hex "#4db3ff")
              , color (hex Color.white)
              ]
        ]
    , class ThemeText
        [ backgroundColor transparent
        , borderColor transparent
        , color (hex Color.blue)
        ]
    ]
