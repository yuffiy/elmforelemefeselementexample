module Button.Stylesheet exposing (..)

import Css           exposing (..)
import Css.Namespace exposing (namespace)

import Color.Main as Color
import Typography.Typography as Typo


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
        ]
    , class ThemeText
        [ backgroundColor transparent
        , borderColor transparent
        , color (hex Color.blue)
        ]
    ]
