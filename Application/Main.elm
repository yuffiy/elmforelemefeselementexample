module Main exposing (..)

import Navigation

import App.Model exposing (Model)
import App.Init exposing (init, parseRoute)
import App.Msg exposing (Msg)
import App.Update exposing (update)
import App.Subscriptions exposing (subscriptions)
import App.View exposing (view)

import Combine exposing (..)
import Combine.Char exposing (..)
import Combine.Num exposing (..)


main : Program Never Model Msg
main =
    let
        _ =
            Debug.log "TEST" <|
                parse program "foo![alt](./images/123.jpg)bar" 
    in
        Navigation.program parseRoute
            { init = init
            , view = view
            , update = update
            , subscriptions = subscriptions
            }


type E
    = EStr String
    | EImg String String


strong =
    string "**" *> regex "[^\n*]*" <* string "**"

em =
    string "*" *> regex "[^\n*]*" <* string "*"

link =
    regex "\\[[^\n\\]]*\\]\\([^\n\\)]*\\)"

str =
    EStr <$> regex "[^\n\\[\\!\\*\\_\\`]*"

img =
    EImg <$> 
        ((string "!") *> (brackets <| regex "[^\n\\]]*"))
        <*> (parens <| regex "[^\n\\)]*")
        <?> "img"

expr =
    lazy <|
        \() ->
            choice
            [ img
            , str
            ]


program =
    manyTill expr end

-- regex "!\\[[^\n\\]]*\\]\\([^\n\\)]*\\)"        


{-
type Size
    = Large
    | Small


type alias Model =
    { value    : Float
    , min      : Float
    , max      : Float
    , step     : Float
    , size     : Maybe Size
    , disabled : Bool
    , controls : Bool
    }


initModel : Model
initModel =
    { value    = 0
    , min      = 0
    , max      = 1 / 0
    , step     = 1
    , size     = Nothing
    , disabled = False
    , controls = True
    }
    


type Msg
    = NoOp
    | Addition
    | Subtraction


update : Msg -> Model -> Model      
update msg model =
    let
        step : Float
        step =
            if model.disabled then
                0
            else
                model.step
    in
        case msg of
            Addition ->
                { model | value = min model.max <| model.value + step }

            Subtraction ->
                { model | value = max model.min <| model.value - step }

            _ ->
                model



-- VIEW

{ id, class, classList } =
    Html.CssHelpers.withNamespace "InputNumber"

                
btnView : Msg -> Bool -> String -> Html Msg
btnView msg isDisabled content =
    button [ onClick msg
           , disabled isDisabled
           ]
        [ text content ]



markdown = """
# Button 按钮

常用的操作按钮。

## 基础用法

基础的按钮用法。


## 禁用状态

按钮不可用状态。


## 有颜色倾向

不同的颜色倾向代表不同的提示


## 图标按钮

带图标的按钮可增强辨识度(有文字)或节省空间(无文字)。


## 按钮组

以按钮组的方式出现，常用于多项类似操作。


## 加载中

点击按钮后进行数据加载操作，在按钮上显示加载状态。


## 不同尺寸

Button 组件提供除了默认值以外的三种尺寸，可以在不同场景下选择合适的按钮尺寸。


"""            



view : Model -> Html Msg
view model =
    let
        defBtnOpts =
            Button.defaultOptions
    in
        div [ class [ Style.Container ] ]
            [ btnView Addition model.disabled "+"
            , div [] [ text (toString model.value) ]
            -- , btnView Subtraction model.disabled "-"
            , text markdown


            -- Button
            , Button.default [] [ text "默认按钮" ]
            , Button.primary [] [ text "主要按钮" ]
            , Button.text [] [ text "文字按钮" ]
            ]

-}
