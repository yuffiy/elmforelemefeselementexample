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


config : String -> Float -> Config
config c s=
    Config c s


defaultConfig : Config
defaultConfig =
    { color = silver
    , size  = 14
    }


color : String -> Config
color c =
    Config c defaultConfig.size


size : Float -> Config
size s =
    Config defaultConfig.color s        
        
