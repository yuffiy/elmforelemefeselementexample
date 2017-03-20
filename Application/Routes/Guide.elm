module Routes.Guide exposing (Sitemap(..), routes, toString)


{-| Gudie subRoutes.

| name   | path          |
|--------|---------------| 
| design | /guide/design |
| nav    | /guide/nav    |

-}


import Routes.Route exposing (..)


type Sitemap
    = Design
    | Nav


design : Route Sitemap
design =
    Design := static "design"


nav : Route Sitemap
nav =
    Nav := static "nav"


routes : List (Route Sitemap)
routes =
    [ design
    , nav
    ]


toString : Sitemap -> String
toString r =
    case r of
        Design ->
            reverse design []
        Nav ->
            reverse nav []
