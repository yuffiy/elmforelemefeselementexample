module Routes.Component exposing (Sitemap(..), routes, toString)


{-| Component subRoutes.

| name           | path                      |
|----------------|---------------------------| 
| installation   | /component/installation   |
| quickstart     | /component/quickstart     |
| dateTimePicker | /component/dateTimePicker |

-}


import Routes.Route exposing (..)


type Sitemap
    = Installation
    | Quickstart
    -- | CustomTheme
    -- | Changelog
    -- | Layout
    -- | Color
    -- | Typography
    -- | Icon
    -- | Button
    -- | Radio
    -- | Checkbox
    -- | Input
    -- | InputNumber
    -- | Select
    -- | Cascader
    -- | Switch
    -- | Slider
    -- | TimePicker
    -- | DatePicker
    -- | DateTimePicker
    -- | Upload
    -- | Rate
    -- | ColorPicker
    -- | Form
    -- | Table


installation : Route Sitemap
installation =
    Installation := static "installation"


quickstart : Route Sitemap
quickstart =
    Quickstart := static "quickstart"

    
routes : List (Route Sitemap)
routes =
    [ installation
    , quickstart
    ]


toString : Sitemap -> String
toString r =
    case r of
        Installation ->
            reverse installation []
        Quickstart ->
            reverse quickstart []
