module InputNumber.Stylesheet exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)

type CssClasses
    = Container

css =
    (stylesheet << namespace "InputNumber")
    [ class Container
          [ backgroundColor <| rgb 255 255 255
          ]
    ]
