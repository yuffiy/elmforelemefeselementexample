module Design.View exposing (view)


{-| Design.View

设计原则

-}


import Html as H exposing (Html, div, text, h1, h2, a, ul, li, nav, strong, h3)
import App.Msg   exposing (Msg(..))

import Component.Layout.Layout exposing (..)
import Contents                exposing (..)

import Combine exposing (..)
import Combine.Char exposing (..)
import Combine.Num exposing (..)



type Block
    = BHeader String
    | BList (List String) 



header : Parser s Block
header =
    BHeader
        <$> regex "#{1,6} [^\n]*"
        <?> "header"



newline =
    between (regex "\n*") (regex "\n*")


list : Parser s Block
list =
    BList
        <$> newline (many <| regex "[-|+|\\d+|\\d+\\.] [^\n]*")
        <?> "list"


expr : Parser s Block
expr =
    lazy <|
        \() ->
            let
                blocks =
                    [ header
                    , list
                    ]
            in
                whitespace *> choice blocks <* whitespace


program : Parser s (List Block)
program =
    manyTill expr end



    {-
                parse program """
# Header1
## Header2
### Header3
#### Header4
##### Header5
###### Header6

- 11111111
  - 2222222
  - 3333333333
+ 444444444
  + foooooooooo
  + barrrrrrrr
"""
-}        

        

view : Html Msg
view =
    let
        title =
            Debug.log "parse" "1"

    in
        div []
            [ h2 [] [ text "123" ]
            , row rowConfig []
                [ col (colConfig |> swap 3) [] [ text "1" ]
                , col (colConfig |> swap 3) [] [ text "2" ]
                , col (colConfig |> swap 3) [] [ text "3" ]
                , col (colConfig |> swap 3) [] [ text "4" ]
                ]
            , h3 [] [ text "一致性 Consistency" ]
            , ul []
                [ li []
                      [ strong [] [ text "与现实生活一致" ]
                      , text "与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念"
                      ]
                , li []
                    [ strong [] [ text "在界面中一致" ]
                    , text "所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等"
                  ]
                ]
            ]
    
