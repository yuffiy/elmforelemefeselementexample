module Component.Icon.Stylesheets exposing (..)

{-| Icon Style

按钮图标样式

-}

import Css           exposing (..)
import Css.Namespace exposing (namespace)


type CssClasses
    = Icon


css =
    (stylesheet << namespace "Icon")
    [ class Icon
          [ display inlineBlock
          , verticalAlign middle
          ]
    ]
