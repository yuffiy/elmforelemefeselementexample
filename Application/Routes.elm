module Routes exposing (Sitemap(..), parsePath, navigateTo, toString)


{-| Routes

-}


import Navigation exposing (Location)
import Route exposing (..)


type Sitemap
    = HomeRoute
    | GuideDesignRoute
    | GuideNavRoute
    | ResourceRoute
    -- | ComponentRoute
    | NotMatchRoute


-- ROUTE "/"

homeRoute : Route Sitemap      
homeRoute =
    HomeRoute := static ""


-- ROUTE "/guids/design"

guideDesignRoute : Route Sitemap                 
guideDesignRoute =
    GuideDesignRoute := static "guide" </> static "design"


guideNavRoute : Route Sitemap                        
guideNavRoute =
    GuideNavRoute := static "guide" </> static "nav"


resourceRoute : Route Sitemap
resourceRoute =
    ResourceRoute := static "resource"





sitemap : Router Sitemap 
sitemap =
    router [ homeRoute
           , guideDesignRoute
           , guideNavRoute
           , resourceRoute
           ]




parsePath : Location -> Sitemap
parsePath =
    match << .pathname


        
match : String -> Sitemap
match =
    Route.match sitemap >> Maybe.withDefault NotMatchRoute



navigateTo : Sitemap -> Cmd msg
navigateTo =
    Navigation.newUrl << toString 


toString : Sitemap -> String
toString route =
    case route of
        HomeRoute ->
            reverse homeRoute []
        GuideDesignRoute ->
            reverse guideDesignRoute []
        GuideNavRoute ->
            reverse guideNavRoute []
        ResourceRoute ->
            reverse resourceRoute []
        NotMatchRoute ->
            Debug.crash "Cant render NotFound"                
