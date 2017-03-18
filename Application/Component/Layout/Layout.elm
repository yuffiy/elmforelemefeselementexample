module Component.Layout.Layout exposing (..)


{-| Layout

布局

-}


import Html as H       exposing (Html, Attribute, div)
import Html.CssHelpers

import Component.Layout.Stylesheets as Style


{ class } =
    Html.CssHelpers.withNamespace "Layout"


type Layout
    = Default
    | Flex
    | Grid


type Justify
    = Start
    | End
    | Center
    | Around
    | Between


type Align
    = Top
    | Middle
    | Bottom

      
type alias RowConfig =
    { gutter  : Float
    , layout  : Layout
    , justify : Justify
    , align   : Align
    }
    

rowConfig : RowConfig
rowConfig =
    { gutter  = 0
    , layout  = Default
    , justify = Start
    , align   = Top
    }


type alias ColConfig =
    { swap : Int
    }


colConfig : ColConfig
colConfig =
    { swap = 0
    }


gutter : Float -> RowConfig
gutter g =
    { rowConfig | gutter = g }


layout : Layout -> RowConfig
layout l =
    { rowConfig | layout = l }


justify : Justify -> RowConfig
justify j =
    { rowConfig | justify = j }


align : Align -> RowConfig
align a =
    { rowConfig | align = a }


row : RowConfig -> List (Attribute msg) -> List (Html msg) -> Html msg
row { gutter, layout, justify, align } =
    let
        lcs =
            case layout of
                Flex ->
                    Style.FlexRow
                _ ->
                    Style.Row
    in
        ((<|) div) << (::) (class [ lcs ])            
    
