module Component.Switch.Stylesheets exposing (..)

{-| Switch Stylesheets


-}

import Css           exposing (..)
import Css.Namespace exposing (namespace)

import Component.Color.Color as Color
import Component.Typo.Typo   as Typo


type CssClasses
    = Container
    | Wrap
    | Cursor
    | Element


containerWidth : Float
containerWidth =
    2.25

containerHeight : Float
containerHeight =
    1

cursorSize : Float
cursorSize =
    1.25

halfw : Float
halfw =
    containerWidth / 2        

wrapWidth : Float
wrapWidth =
    halfw + cursorSize - halfw

cursorTranslateX : Float
cursorTranslateX =
    (cursorSize - halfw) / 2 * -1

cursorTranslateY : Float
cursorTranslateY =
    (cursorSize - containerHeight) / 2 * -1 
        

css =
    (stylesheet << namespace "Switch")
    [ class Container
          [ display inlineBlock
          , lineHeight (int 1)
          , verticalAlign middle
          , cursor pointer
          , backgroundColor (hex "#efdfef")
          , borderRadius (Css.rem containerHeight)
          , width (Css.rem containerWidth)
          , height (Css.rem containerHeight)
          , margin2 zero (Css.rem (negate cursorTranslateX))
          , position relative
          , property "transition" "background-color 0.28s ease-in-out 0s"
          ]
    , class Wrap
          [ position relative
          , width (Css.rem wrapWidth)
          , height (Css.rem containerHeight)
          ]
    , class Cursor
          [ position absolute
          , left (Css.rem cursorTranslateX)
          , top (Css.rem cursorTranslateY)
          , backgroundColor (hex "#ae8cff")
          , width (Css.rem cursorSize)
          , height (Css.rem cursorSize)
          , borderRadius (pct 50)
          -- , Css.transform (translate3d (Css.rem cursorTranslateX) (Css.rem cursorTranslateY) zero)
          , property "transition" "background-color 0.28s ease-in-out 0s"
          ]
    , class Element
          [ display none
          , property "visibility" "hidden"
          ]
    ]
