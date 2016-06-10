module MetroUi.Widgets.Frame exposing ( Msg
                                      , Model
                                      , defaultFrame
                                      , defaultFrameWithIcon
                                      , frameWithColor
                                      , frameWithIconAndColor
                                      , update
                                      , view )

import Html
import Html.Attributes as Attr
import Html.Events as Evt

type FrameStates
  = Inactive
  | Active
  | Disabled

type alias FrameHeading =
  { id: String
  , content: String
  , icon: String
  , colors: List String }

type alias FrameContent =
  { id: String
  , content: String }

type alias Model =
  { id: String
  , state: FrameStates
  , heading: FrameHeading
  , content: FrameContent }

type Msg
  = HeadingClick String

defaultFrame : String -> String -> String -> Model
defaultFrame id title content =
  let
    heading = FrameHeading "" title "" []
    body = FrameContent "" content
    f = Model id Inactive heading body
  in
    f

defaultFrameWithIcon : String -> String -> String -> String -> Model
defaultFrameWithIcon id icon title content =
  let
    heading = FrameHeading "" title icon []
    body = FrameContent "" content
    f = Model id Inactive heading body
  in
    f

frameWithColor : String -> List String -> String -> String -> Model
frameWithColor id colors title content =
  let
    heading = FrameHeading "" title "" colors
    body = FrameContent "" content
    f = Model id Inactive heading body
  in
    f

frameWithIconAndColor : String -> List String -> String -> String -> String -> Model
frameWithIconAndColor id colors icon title content =
  let
    heading = FrameHeading "" title icon colors
    body = FrameContent "" content
    f = Model id Inactive heading body
  in
    f

update : Msg -> Model -> Model
update message model =
  case message of
    HeadingClick id ->
      if model.id == id then
        case model.state of
          Inactive -> { model | state = Active }
          Active -> { model | state = Inactive }
          Disabled -> model
      else model

view : Model -> Html.Html Msg
view model =
  let
    frameHeading = [ ( "frame", True ) ]
    state = frameState model
    id = frameId model

    heading = [ ( "heading", True ) ]
    headingId = frameHeadingId model
    headingColors = frameHeadingColors model
    headingIcon = frameHeadingIcon model
    headingContent = frameHeadingContent model

    content = [ ( "content", True ) ]
    contentId = frameContentId model
    contentContent = frameContentContent model
  in
    Html.div
    [ Attr.classList ( frameHeading ++ state ),
      Evt.onClick ( HeadingClick model.id ),
      id ]
    [ Html.div [ Attr.classList ( heading ++ headingColors ), headingId ]
      [ headingContent, headingIcon ]
    , Html.div [ Attr.classList ( content ), contentId ]
      [ contentContent ] ]


-- Helpers

frameId : Model -> Html.Attribute Msg
frameId model =
  case model.id of
    "" -> Attr.id ""
    id -> Attr.id id

frameContentId : Model -> Html.Attribute Msg
frameContentId model =
  case model.content.id of
    "" -> Attr.id ""
    id -> Attr.id id

frameContentContent : Model -> Html.Html Msg
frameContentContent model =
  Html.text model.content.content

frameHeadingId : Model -> Html.Attribute Msg
frameHeadingId model =
  case model.heading.id of
    "" -> Attr.id ""
    id -> Attr.id id

frameHeadingColors : Model -> List (String, Bool)
frameHeadingColors model =
  case model.heading.colors of
    [] -> []
    colors -> List.map (\color -> (color, True)) colors

frameHeadingIcon : Model -> Html.Html Msg
frameHeadingIcon model =
  case model.heading.icon of
    "" -> Html.span [] []
    icon -> Html.span [ Attr.class (icon ++ " icon") ] []

frameHeadingContent : Model -> Html.Html Msg
frameHeadingContent model =
  case model.heading.content of
    "" -> Html.text ""
    content -> Html.text content

frameState : Model -> List (String, Bool)
frameState model =
  case model.state of
    Inactive -> [ ( "active", False ), ( "disabled", False ) ]
    Active ->   [ ( "active", True ), ( "disabled", False ) ]
    Disabled -> [ ( "active", False ), ( "disabled", True ) ]
