module Component.Typo.Stylesheets exposing (..)


{-| Typo

全局排版样式

-}


import Css           exposing (..)
import Css.Elements  exposing (..)
import Css.Namespace exposing (namespace)

import Component.Color.Color as Color
import Component.Typo.Typo   as Typo


type CssClasses
    = Section


css =
    (stylesheet << namespace "global")
    [ each [html, body]
          [ height (pct 100) 
          ]
    , body
          [ fontFamilies Typo.fontFamily
          , fontSize (px Typo.medium)
          , overflowX hidden
          , color (hex Color.black)
          , children
                [ div
                  [ height (pct 100)
                  ]
                ]
          ]
    , each [ h1, h2, h3, h4, h5, h6, p ]
          [ margin zero
          , marginBottom (Css.rem 0.5)
          , fontWeight inherit
          , fontStyle inherit
          , lineHeight (num 1.58)
          ]
    , h1
          [ fontSize (Css.rem 1.78)
          ]
    , h2
          [ fontSize (Css.rem 1.4)
          ]
    , h3
          [ fontSize (Css.rem 1.26)
          ]
    , h4
          [ fontSize (Css.rem 1.1)
          ]
    , h5
          [ fontSize (Css.rem 1.05)
          ]
    , h6
          [ fontSize (Css.rem 1)
          ]
    , p
          [ fontSize (px Typo.small)
          ]
    , ul
          [ listStyleType none
          , padding zero
          , margin zero
          ]
    , li
          [ fontSize (px Typo.small)
          ]
    , a
          [ textDecoration none
          , color inherit
          , hover
              [ color inherit
              ]
          ]
        
    , class Section
          [ marginBottom (Css.rem 1)
          ]
    ]
