module Component.Layout.Stylesheets exposing (..)


import Css           exposing (..)
import Css.Namespace exposing (namespace)


type CssClasses
    = Row
    | FlexRow
    | FlexStart
    | FlexCenter
    | Col
    | Swap Int



swaps =
    let
        tocss i =
            class (Swap i)
                [ width (pct ((toFloat i) / 12 * 100))
                ]
    in
        List.range 0 12 |> List.map tocss


css =
    (stylesheet << namespace "Layout") <|
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
    , class FlexStart
          [ justifyContent flexStart
          ]
    , class FlexCenter
          [ justifyContent center
          ]
    , class Col
          [ boxSizing borderBox
          , float left
          ]
    ] ++ swaps
