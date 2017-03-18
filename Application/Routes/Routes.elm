module Routes.Routes exposing (parsePath, navigateTo)


{-| Routes

-}


import Navigation   exposing (Location)
import Routes.Route exposing (..)

import Routes.App as App
-- import Routes.Component as Component


-- type Sitemap
--     = Home
--     | Guide Guide.Sitemap
--     | Component Component.Sitemap
--     | Resource
--     | NoMatch


-- home : Route Sitemap      
-- home =
--     Home := static ""            


-- guide : Route Sitemap
-- guide =
--     Guide := static "guide" </> child "guide" Guide.routes

             
-- component : Route Sitemap
-- component =
--     Component := static "component" </> child "component" Component.routes             


-- resource : Route Sitemap
-- resource =
--     Resource := static "resource"


sitemap : Router App.Sitemap 
sitemap =
    router App.routes


parsePath : Location -> App.Sitemap
parsePath =
    match_ << .pathname


match_ : String -> App.Sitemap
match_ =
    match sitemap >> Maybe.withDefault App.NoMatch


navigateTo : App.Sitemap -> Cmd msg
navigateTo =
    Navigation.newUrl << App.toString 


-- toString : Sitemap -> String
-- toString route =
--     case route of
--         Home ->
--             reverse home []
--         Guide c ->
--             reverse guide [ Guide.toString c ]
--         Component c ->
--             reverse component [ Component.toString c ]
--         Resource ->
--             reverse resource []
--         _ ->
--             Debug.crash "Cant render NotFound"
                
