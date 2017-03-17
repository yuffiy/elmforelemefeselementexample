module Routes.Routes exposing (Sitemap(..), parsePath, navigateTo, toString)


{-| Routes

-}


import Navigation   exposing (Location)
import Routes.Route exposing (..)

import Routes.Guide     as Guide
import Routes.Component as Component


type Sitemap
    = Home
    | Guide Guide.Sitemap
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


sitemap : Router Sitemap 
sitemap =
    router [ home
           , guide
           , component
           , resource
           ]


parsePath : Location -> Sitemap
parsePath =
    match_ << .pathname


match_ : String -> Sitemap
match_ =
    match sitemap >> Maybe.withDefault NoMatch


navigateTo : Sitemap -> Cmd msg
navigateTo =
    Navigation.newUrl << toString 


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
            Debug.crash "Cant render NotFound"                
