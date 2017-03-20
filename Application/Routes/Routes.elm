module Routes.Routes exposing (parsePath, navigateTo)


{-| Routes



-}


import Navigation        exposing (Location)
import Routes.Route      exposing (..)

import Routes.App as App exposing (..)


sitemap : Router Sitemap 
sitemap =
    router routes


parsePath : Location -> Sitemap
parsePath =
    match_ << .pathname


match_ : String -> Sitemap
match_ =
    match sitemap >> Maybe.withDefault NoMatch


navigateTo : Sitemap -> Cmd msg
navigateTo =
    Navigation.newUrl << App.toString 
