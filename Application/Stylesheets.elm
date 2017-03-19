port module Stylesheets exposing (..)

    
{-| Stylesheets

样式表打包

-}    


import Css.File exposing (CssFileStructure, CssCompilerProgram)

import Component.Typo.Stylesheets   as Typo
import Component.Layout.Stylesheets as Layout
import Component.Button.Stylesheets as Button
import Component.Icon.Stylesheets   as Icon

import App.Stylesheets              as App


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
  Css.File.toFileStructure
    [ ( "index.css"
      , Css.File.compile [ Typo.css
                         , Layout.css
                         , Icon.css
                         , Button.css

                         , App.css
                         ]
      ) ]


main : CssCompilerProgram
main =
  Css.File.compiler files fileStructure
