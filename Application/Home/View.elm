module Home.View exposing (view)


{-| Home.View

首页

-}


import Html as H       exposing (Html, div, text, h1, h2, a, ul, li, nav, header, section, footer, aside)
import Html.Events     exposing (onClick, onWithOptions)
import Html.Attributes exposing (href)

import App.Model       exposing (Model)
import App.Msg         exposing (Msg(..))

import Header.View as Header
import Component.Switch.Switch as Switch

import Markdown exposing (render)

banner : Html Msg
banner =
    div []
        [ h2 [] [ text "网站快速成型工具" ]
        ]


view : Model -> Html Msg
view m =
    div []
        [ (Header.view "" m)
        , section []
            ([ banner
            ] ++ (render markdown))
        -- , (H.map (\_ -> NoOp) (Switch.view Switch.initModel))
        , Switch.view NoOp Switch.initModel
        , footer []
            []
        ]



markdown = """
# Button 按钮

常用的操作按钮。[github](http://github.com)

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
