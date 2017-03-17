module App.Init exposing (init, parseRoute)


{-| Compose all inits

-}


import Navigation exposing (Location)
import Routes.Routes exposing (Sitemap, parsePath)
import App.Model exposing (Model, initModel)
import App.Msg exposing (Msg(..))


init : Location -> (Model, Cmd Msg)
init location =
    let
        route : Sitemap
        route =
            parsePath location

                
        model : Model
        model =
            { initModel
                | route = route
            }


        cmds : Cmd Msg
        cmds =
            Cmd.batch
                []
    in
        ( model, cmds )



parseRoute : Location -> Msg
parseRoute =
    parsePath >> RouteChanged            