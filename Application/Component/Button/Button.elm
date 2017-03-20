module Component.Button.Button exposing
    ( defaultOptions
    , Theme(..)
    , Size(..)
    , ButtonType(..)
    , button
    , default
    , primary
    , text
    )


{-| Button


-}

import Html            exposing (Html, Attribute)
import Html.Attributes exposing (style, autofocus, type_, disabled)
import Html.CssHelpers
import Component.Button.Stylesheets as Style

import Component.Color.Color exposing (..)
import Debug




type Size
    = Normal
    | Small
    | Mini
    | Large


type Theme
    = Default
    | Primary
    | Success
    | Warning
    | Danger
    | Info
    | Text


type ButtonType
    = Button
    | Submit
    | Reset



(<=) = (,)

type alias InlineStyle = List (String, String)       
       

basicStyles : InlineStyle
basicStyles =
    [ "display" <= "inline-block"
    , "line-height" <= "1"
    , "white-space" <= "nowrap"
    , "cursor" <= "pointer"
    , "background" <= white
    , "border" <= "1px solid #BFCBD9"
    , "color" <= black
    , "text-align" <= "center"
    , "box-sizing" <= "border-box"
    , "outline" <= "none"
    , "margin" <= "0"
    , "user-select" <= "none"
    , "padding" <= "10px 15px"
    , "font-size" <= "14px"
    , "border-radius" <= "4px"
    ]


mapThemeToClassNames : Theme -> Style.CssClasses
mapThemeToClassNames theme =
    case theme of
        Primary ->
            Style.ThemePrimary
        Text ->
            Style.ThemeText
        _ ->
            Style.NoOp
            

mapButtonTypeToTypeAttr : ButtonType -> String
mapButtonTypeToTypeAttr btnType =
    case btnType of
        Submit ->
            "submit"
        Reset ->
            "reset"
        _ ->
            "button"

      
type alias Options =
    { size       : Size
    , theme      : Theme
    , plain      : Bool
    , loading    : Bool
    , disabled   : Bool
    , icon       : Maybe String
    , autofocus  : Bool
    , buttonType : ButtonType 
    }


defaultOptions : Options
defaultOptions =
    { size       = Normal
    , theme      = Default
    , plain      = False
    , loading    = False
    , disabled   = False
    , icon       = Nothing
    , autofocus  = False
    , buttonType = Button
    }



type ActionType
    = Entry
    | Leave

-- onHover : ActionType ->


-- VIEW

{ class, classList } =
    Html.CssHelpers.withNamespace "Button"


type alias Node msg =
    List (Attribute msg) -> List (Html msg) -> Html msg



                            
button : Options -> Node msg    
button options attrs children =
    let
        buttonAttrs : List (Attribute msg)
        buttonAttrs =
            [ autofocus options.autofocus
            , type_ <| mapButtonTypeToTypeAttr options.buttonType
            , disabled options.disabled
            -- , style <| basicStyles ++ mapThemeToStyles options.theme
            , class [ Style.ThemeDefault
                    , mapThemeToClassNames options.theme
                    ]
            ]

            
        iconView : List (Html msg)
        iconView =
            []


        loadingView : List (Html msg)
        loadingView =
            []
            
    in
        Html.button
            (buttonAttrs ++ attrs)
            (iconView ++ loadingView ++ children)



default : Node msg
default =
    button defaultOptions 

    
primary : Node msg
primary =
    button { defaultOptions | theme = Primary }


text : Node msg
text =
    button { defaultOptions | theme = Text }        
