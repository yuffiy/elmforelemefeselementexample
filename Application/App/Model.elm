module App.Model exposing (Model, initModel)


{-| Compose all models

-}


import Routes.App exposing (Sitemap(..))


type alias Model =
    { route : Sitemap
    }


initModel : Model
initModel =
    { route = Home
    }
