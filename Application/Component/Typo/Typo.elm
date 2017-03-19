module Component.Typo.Typo exposing (..)


{-| Typo


排版

# Font Family
@docs fontFamily, extraLarge, large  

-}


fontFamily : List String
fontFamily =
    [ "\"Helvetica Neue\""
    , "\"Helvetica\""
    , "\"PingFang SC\""
    , "\"Hiragino Sans GB\""
    , "\"Microsoft YaHei\""
    , "\"微软雅黑\""
    , "\"Arial\""
    , "sans-serif"
    ]


{-| Extra Large -}    
extraLarge : Float
extraLarge =
    20


{-| Large -}        
large : Float
large =
    18


{-| Medium -}        
medium : Float
medium =
    16


{-| Small -}        
small : Float
small =
    14


{-| Extra Small -}        
extraSmall : Float
extraSmall =
    13


{-| Extra Extra Small -}        
extraExtraSmall : Float
extraExtraSmall =
    12
