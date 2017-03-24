module Markdown exposing (..)

 
{-| Markdown parser

Convert markdown to Html

-}


import Combine         exposing (..)
import Combine.Char    exposing (..)
import Combine.Num     exposing (..)
import Html as H       exposing (Html)
import Html.Attributes exposing (..)


type Inline
    = IText String
    -- | IStrong Inline
    -- | IEm Inline
    | IEmphasis String Inline
    | IImage String String
    | ILink String String
    | ICode String


-- strong : Parser s Inline      
-- strong =
--     IStrong <$> (string "**" *> expr <* string "**")
--             <?> "strong"

                
-- em : Parser s Inline
-- em =
--     IEm <$> (string "*" *> expr <* string "*")
--         <?> "em"


emphasisParsers : Parser s a -> Parser s a            
emphasisParsers =
    let
        reEm =
            regex "\\*{1,3}"
    in
        between reEm reEm


emphasis : Parser s Inline
emphasis =
    IEmphasis <$> (regex "\\*{1,3}")
              <*> text
              <?> "emphasis"

        
link : Parser s Inline
link =
    ILink <$> (brackets <| regex "[^\n\\]]*")
          <*> (parens <| regex "[^\n\\)]*")
          <?> "link"


text : Parser s Inline     
text =
    IText <$> regex "[^\n\\[\\!\\*\\_\\`]*"
          <?> "text"


image : Parser s Inline        
image =
    IImage <$> ((string "!") *> (brackets <| regex "[^\n\\]]*"))
           <*> (parens <| regex "[^\n\\)]*")
           <?> "image"

code : Parser s Inline
code =
    ICode <$> (between (string "`") (string "`") (regex "[^`\n]*"))
          <?> "code"

expr =
    let
        expr_ =
            lazy <|
                \() ->
                    choice
                    [ link
                    , image
                    , code
                    , emphasis
                    , text
                    ]
    in
        expr_


type Block
    = BInline (List Inline)
    | BHeader String (List Inline)


inline : Parser s Block
inline =
    BInline <$> (many expr) <?> "inline"


header : Parser s Block
header =
    BHeader <$> ((regex "#{1,4}") <* (regex " *"))
            <*> (many expr)
            <?> "header"


block : Parser s Block
block =
    let
        blocks =
            lazy <|
                \() ->
                    choice [ header
                           , inline
                           ]
    in
        whitespace *> blocks <* whitespace


program : Parser s (List Block)            
program =
    manyTill block end

        

formatError : List String -> InputStream -> String
formatError ms stream =
    let
        location =
            currentLocation stream

        separator =
            "| "

        expectationSeparator =
            "\n  * "

        lineNumberOffset =
            floor (logBase 10 (toFloat location.line)) + 1

        separatorOffset =
            String.length separator

        padding =
            location.column + separatorOffset + 2
    in
        "Parse error around line:\n\n"
            ++ toString location.line
            ++ separator
            ++ location.source
            ++ "\n"
            ++ String.padLeft padding ' ' "^"
            ++ "\nI expected one of the following:\n"
            ++ expectationSeparator
            ++ String.join expectationSeparator ms


parser : String -> Result String (List Block)
parser s =
    case parse program s of
        Ok ( _, _, es ) ->
            Ok es

        Err ( _, stream, ms ) ->
            Err <| formatError ms stream



render : String -> List (Html msg)
render str =
    let
        mapi inline =
            case inline of
                IText s ->
                    H.text s
                IEmphasis t s ->
                    case t of
                        "***" ->
                            H.strong [] [ H.em [] [ H.text (toString s) ]
                                        ]
                        "**" ->
                            H.strong [] [ H.text (toString s) ]
                        _ ->
                            H.em [] [ H.text (toString s) ]
                IImage a s ->
                    H.img [ alt (toString a)
                          , src (toString s)
                          ] []
                ICode s ->
                    H.code [] [ H.text (toString s) ]
                ILink t s ->
                    H.a [ title t
                        , href s
                        ] [ H.text t ]
                
        mapb block =
            case block of
                BInline s ->
                    H.p [] <| List.map mapi s
                BHeader n s ->
                    H.h1 [] <| List.map mapi s

    in
        Result.map (List.map mapb) (parser str)
            |> Result.withDefault []
                    
