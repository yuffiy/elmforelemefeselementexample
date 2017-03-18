module Component.Layout.Stylesheets exposing (..)


import Css           exposing (..)
import Css.Namespace exposing (namespace)


type CssClasses
    = Row
    | FlexRow
    | FlexJustifyStart
    | FlexJustifyEnd
    | Col
    | Swap Int


css =
    (stylesheet << namespace "Layout")
    [ class Row
          [ boxSizing borderBox
          -- , float left
          -- , position relative
          , after
              [ property "content" "' '"
              , display table
              , property "clear" "both"
              ]
          ]
    , class FlexRow
          [ displayFlex
          ]
    , class Col
          [ boxSizing borderBox
          , float left
          ]
    , class (Swap 4)
          [ width (px 25)
          ]
    ]
