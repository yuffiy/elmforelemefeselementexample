module App.Stylesheets exposing (..)


{-| App

App样式

-}


import Css           exposing (..)
import Css.Namespace exposing (namespace)

import Component.Color.Color as Color
import Component.Typo.Typo   as Typo


type CssClasses
    = NoOp
    | Container
    | MainContainer
    | Header
    | HeaderContainer
    | HeaderLeftContainer
    | HeaderRightContainer
    | LogoContainer
    | Logo
    | NavContainer
    | NavItemContainer
    | NavItem
    | NavItemActive
    | Aside
    | AsideNavItem
    | AsideNavItemActive
    | Main


css =
    (stylesheet << namespace "App")
    [ class Container
          [ displayFlex
          , height (pct 100)
          , flexDirection column
          , justifyContent center
          ]
    , class MainContainer
          [ displayFlex
          , flex auto
          , width (px 1140)
          , boxSizing borderBox
          , margin2 zero auto
          , padding2 (Css.rem 3) (Css.rem 1)
          ]
    , class HeaderContainer
          [ displayFlex
          , boxSizing borderBox
          , width (px 1140)
          , height (Css.rem 5)
          , margin2 zero auto
          , padding2 zero (Css.rem 1)
          ]
    , class HeaderLeftContainer
          [ flex auto
          , displayFlex
          , justifyContent flexStart
          , alignItems center
          ]
    , class HeaderRightContainer
          [ flex auto
          , displayFlex
          , justifyContent flexEnd
          , alignItems center          
          ]
    , class LogoContainer
          [ flex auto
          , color (hex Color.white)
          ]
    , class Logo
          [ width (Css.rem 10)
          , height (Css.rem 2)
          ]
    , class NavContainer
          [ displayFlex
          , width (Css.rem 20)
          , margin2 zero auto
          , paddingRight (Css.rem 2)
          ]
    , class NavItemContainer
          [ flex auto
          , displayFlex
          , justifyContent center
          , alignItems center
          ]
    , class NavItem
          [ displayFlex
          , justifyContent center
          , alignItems center
          , padding2 zero (Css.rem 1.25)
          , height (Css.rem 5)
          , boxSizing borderBox
          , fontSize (px Typo.medium)
          , color (hex Color.white)
          , opacity (num 0.8)
          , hover
              [ opacity (num 1)
              ]
          , withClass NavItemActive
              [ opacity (num 1)
              , borderBottom3 (px 4) solid (rgba 255 255 255 0.8) 
              ]
          ]
    , class Header
          [ flex2 zero (Css.rem 3.5)
          , backgroundColor (hex Color.blue)
          ]
    , class Aside
          [ flex2 zero (pct 20)
          ]
    , class AsideNavItem
          [ boxSizing borderBox
          , height (Css.rem 3)
          , lineHeight (Css.rem 3)
          , fontSize (px Typo.medium)
          , withClass AsideNavItemActive
              [ color (hex Color.blue)
              ]
          ]
    , class Main
          [ flex auto
          ]
    ]
