module App.Update exposing (update)


{-| App Update

-}


import Routes.Routes as Routes exposing (navigateTo, parsePath)
import Routes.App exposing (Sitemap)
import App.Model exposing (Model)
import App.Msg   exposing (Msg(..))


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        RouteChanged route ->
            handleRoute route model

        RouteTo route ->
            model ! [ Routes.navigateTo route ]
                
        _ ->
            ( model, Cmd.none )


handleRoute : Sitemap -> Model -> ( Model, Cmd Msg )
handleRoute route model =
    let
        m =
            { model | route = route }
    in
        case route of
            _ ->
                m ! []
