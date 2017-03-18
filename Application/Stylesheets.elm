port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import InputNumber.Stylesheet as InputNumber
import Component.Button.Stylesheets as Button
import Component.Icon.Stylesheets as Icon



port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
  Css.File.toFileStructure
    [ ( "index.css"
      , Css.File.compile [ Icon.css
                         , Button.css
                         ]
      ) ]


main : CssCompilerProgram
main =
  Css.File.compiler files fileStructure
