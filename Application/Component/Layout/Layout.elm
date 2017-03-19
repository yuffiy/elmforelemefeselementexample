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


gutter : Float -> RowConfig -> RowConfig
gutter g c =
    { c | gutter = g }


layout : Layout -> RowConfig -> RowConfig
layout l c =
    { c | layout = l }


justify : Justify -> RowConfig -> RowConfig
justify j c =
    { c | justify = j }


align : Align -> RowConfig -> RowConfig
align a c =
    { c | align = a }


swap : Int -> ColConfig -> ColConfig
swap s c =
    { c | swap = s }


row : RowConfig -> List (Attribute msg) -> List (Html msg) -> Html msg
row { gutter, layout, justify, align } =
    let
        lcs =
            case layout of
                Flex ->
                    Style.FlexRow :: []
                _ ->
                    Style.Row :: []
                        
        jcs =
            if layout == Flex then
                case justify of
                    Center ->
                        Style.FlexStart :: []
                    _ ->
                        Style.FlexStart :: []
                else
                    []

                        
        acs =
            if layout == Flex then
                case align of
                    Middle ->
                        Style.FlexStart :: []
                    Top ->
                        Style.FlexStart :: []
                    Bottom ->
                        Style.FlexStart :: []
            else
                []
                        
    in
        ((<|) div) << (::) (class <| lcs ++ jcs)            
    



col : ColConfig -> List (Attribute msg) -> List (Html msg) -> Html msg
col { swap } =
    let
        ccs =
            Style.Col
        scs =
            Style.Swap swap
    in
        ((<|) div) << (::) (class [ ccs, scs ])
