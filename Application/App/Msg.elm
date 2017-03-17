module App.Msg exposing (Msg(..))


{-| Compose all msgs

-}


import Routes.Routes exposing (Sitemap(..))


type Msg
    = RouteChanged Sitemap
    | RouteTo Sitemap
    | NoOp
