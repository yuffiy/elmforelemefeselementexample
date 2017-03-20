module Routes.App exposing (Sitemap(..), routes, toString, toParent)


{-| App routes.

| name      | path          |
|-----------|---------------| 
| home      | /home         |
| guide     | /guide/       |
| component | /component/   |
| resource  | /resource     |

-}


import Routes.Route     exposing (..)

import Routes.Guide     as Guide
import Routes.Component as Component


type Sitemap
    = Home
    | GuideHome
    | Guide Guide.Sitemap
    | ComponentHome
    | Component Component.Sitemap
    | Resource
    | NoMatch


home : Route Sitemap      
home =
    Home := static ""            


guide : Route Sitemap
guide =
    Guide := static "guide" </> child "guide" Guide.routes

             
component : Route Sitemap
component =
    Component := static "component" </> child "component" Component.routes             


resource : Route Sitemap
resource =
    Resource := static "resource"


routes : List (Route Sitemap) 
routes =
    [ home
    , guide
    , component
    , resource
    ]
    

toString : Sitemap -> String
toString route =
    case route of
        Home ->
            reverse home []
        Guide c ->
            reverse guide [ Guide.toString c ]
        Component c ->
            reverse component [ Component.toString c ]
        Resource ->
            reverse resource []
        _ ->
            Debug.crash "Cant render NoMatch"                


toParent : Sitemap -> Maybe Sitemap
toParent s =
    case s of
        Guide c ->
            Just GuideHome
        Component c ->
            Just ComponentHome
        _ ->
            Nothing
