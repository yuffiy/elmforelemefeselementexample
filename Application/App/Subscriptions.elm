module App.Subscriptions exposing (subscriptions)


{-| App Subscription

-}


import App.Model exposing (Model)
import App.Msg   exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
