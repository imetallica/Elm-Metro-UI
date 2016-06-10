module MetroUi.Widgets.Accordion exposing ( Model
                                          , Msg
                                          , defaultAccordion
                                          , defaultBigAccordion
                                          , accordion
                                          , update
                                          , view )

import Html
import Html.App
import Html.Attributes as Attr
import MetroUi.Widgets.Frame as Frame

import MetroUi.Utils.Uuid as Uuid

type alias Model =
  { id: String
  , frames: List Frame.Model
  , colors: List String
  , size: Size
  }

type Msg
  = FrameMsg Frame.Msg
  | UUID String
  | Init

type Size = Big | Normal


defaultAccordion : List Frame.Model -> ( Model, Cmd Msg )
defaultAccordion frames =
  let
    model = Model "" frames [] Normal
  in
    update Init model

defaultBigAccordion : List Frame.Model -> ( Model, Cmd Msg )
defaultBigAccordion frames =
  let
    model = Model "" frames [] Big
  in
    update Init model

accordion : List String -> Size -> List Frame.Model -> Model
accordion colors size frames =
  Model "" frames colors size

update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
  case message of
    Init -> ( model, Uuid.genUuid UUID )
    FrameMsg msg ->
      let
        model = { model | frames = List.map (\frame -> Frame.update msg frame) model.frames }
      in
        ( model, Cmd.none )

    UUID uuid ->
      if model.id == "" then ( { model | id = uuid }, Cmd.none ) else ( model, Cmd.none )

view : Model -> Html.Html Msg
view model =
  let
    heading = [ ( "accordion", True ) ]
    id = accordionId model
    colors = accordionColors model
    frames = getFrames model
    size = accordionSize model
  in
    Html.div [ Attr.classList ( heading ++ colors ++ size ), id ] frames

-- Helpers

accordionSize : Model -> List (String, Bool)
accordionSize model =
  case model.size of
    Big -> [ ( "large-heading", True ) ]
    Normal -> [ ( "", False ) ]

accordionColors : Model -> List (String, Bool)
accordionColors model =
  case model.colors of
    [] -> []
    colors -> List.map (\color -> (color, True)) colors

accordionId : Model -> Html.Attribute Msg
accordionId model =
  case model.id of
    "" -> Attr.id ""
    id -> Attr.id id

getFrames : Model -> List ( Html.Html Msg )
getFrames model =
  List.map (\frame -> Html.App.map FrameMsg (Frame.view frame)) model.frames
