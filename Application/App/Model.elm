module App.Model exposing (Model, initModel)


{-| Compose all models

-}


import Routes exposing (Sitemap(..))


type alias Model =
    { route : Sitemap
    }


initModel : Model
initModel =
    { route = HomeRoute
    }
