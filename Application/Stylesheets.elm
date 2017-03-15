port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import InputNumber.Stylesheet as InputNumber
import Button.Stylesheet as Button


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
  Css.File.toFileStructure
    [ ( "index.css", Css.File.compile [ InputNumber.css
                                      , Button.css
                                      ] ) ]


main : CssCompilerProgram
main =
  Css.File.compiler files fileStructure
