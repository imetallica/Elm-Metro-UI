module MetroUi exposing (..)

import Html exposing (Html, text, div, h1)
import Html.App as App
import MetroUi.Widgets.Accordion as Accordion
import MetroUi.Widgets.Frame as Frame

type alias MetroUiModel =
  { accordion : Accordion.Model
  , bigAccordion : Accordion.Model }

type Msg =
  AccordionMsg Accordion.Msg

frame1 = Frame.defaultFrame "frame-1" "Hey" "Hello World!"
frame2 = Frame.defaultFrameWithIcon "frame-2" "mif-earth fg-yellow" "Hey" "Hello World!"

init : ( MetroUiModel, Cmd Msg )
init =
  let
    ( accordion, accordionCmd ) = Accordion.defaultAccordion [ frame1 ]
    ( bigAccordion, bigAccordionCmd ) = Accordion.defaultBigAccordion [ frame2 ]
  in
    ( MetroUiModel accordion bigAccordion ) ! [ Cmd.map AccordionMsg accordionCmd
                                              , Cmd.map AccordionMsg bigAccordionCmd ]

update : Msg -> MetroUiModel -> ( MetroUiModel, Cmd Msg )
update message model =
  case message of
    AccordionMsg msg ->
      let
        ( accordion, accordionCmd1 ) = Accordion.update msg model.accordion
        ( bigAccordion, accordionCmd2 ) = Accordion.update msg model.bigAccordion
      in
        ( { model | accordion = accordion, bigAccordion = bigAccordion } ) ! [ Cmd.map AccordionMsg accordionCmd1
                                                                             , Cmd.map AccordionMsg accordionCmd2 ]


subscriptions model =
  Sub.none

view : MetroUiModel -> Html Msg
view model =
  div []
    [ App.map AccordionMsg ( Accordion.view model.accordion )
    , App.map AccordionMsg ( Accordion.view model.bigAccordion ) ]

main =
  App.program (
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view } )
