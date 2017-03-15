module Routes exposing (GuideSitemap(..), Sitemap(..), parsePath, navigateTo, toString)


{-| Routes

-}


import Navigation exposing (Location)
import Combine exposing (..)
import Route exposing (..)



type GuideSitemap
    = GuideHomeRoute
    | DesignRoute
    | NavRoute


guideHomeRoute : Route GuideSitemap
guideHomeRoute =
    GuideHomeRoute := static ""
      

designRoute : Route GuideSitemap
designRoute =
    DesignRoute := static "design"


navRoute : Route GuideSitemap
navRoute =
    DesignRoute := static "nav"


sitemapGuide : Router GuideSitemap
sitemapGuide =
    router [ guideHomeRoute
           , designRoute
           , navRoute
           ]


routeGuide : GuideSitemap -> String
routeGuide route =
    case route of
        GuideHomeRoute ->
            reverse guideHomeRoute []
        DesignRoute ->
            reverse designRoute []
        NavRoute ->
            reverse navRoute []


guide : Parser s GuideSitemap
guide =
    choice
        [ DesignRoute <$ Combine.string "design233"
        , NavRoute <$ Combine.string "nav123"
        , GuideHomeRoute <$ Combine.string ""
        ]


show : GuideSitemap -> String
show guide =
    case guide of
        DesignRoute ->
            "design233"
        NavRoute ->
            "nav"
        GuideHomeRoute ->
            ""
    

type Sitemap
    = HomeRoute
    | GuideDesignRoute
    | GuideNavRoute
    | GuideRoute GuideSitemap
    | ResourceRoute
    -- | ComponentRoute
    | NotMatchRoute


-- ROUTE "/"

homeRoute : Route Sitemap      
homeRoute =
    HomeRoute := static ""


-- ROUTE "/guide"

guideRoute : Route Sitemap
guideRoute =
    GuideRoute := static "guide" </> custom guide


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
           , guideRoute
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
        GuideRoute c ->
            reverse guideRoute [ show c ]
        _ ->
            Debug.crash "Cant render NotFound"                
