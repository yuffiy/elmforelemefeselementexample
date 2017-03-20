module Component.Icon.Icon exposing (..)


{-| Icon Options

图标配置

@docs loading

-}


import Component.Color.Color exposing (silver)


-- { class } =
--     Html.CssHelpers.withNamespace "Icon"


type alias Config =
    { color : String
    , size  : Float
    }


config : Config
config =
    { color = silver
    , size  = 14
    }


color : String -> Config -> Config
color cc c =
    Config cc c.size


size : Float -> Config -> Config
size s c =
    Config c.color s        
        
