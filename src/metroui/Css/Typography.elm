module Metro.Ui.Typography exposing ( Classes(..) )
import String
import List
import Html.Attributes as Attr

type Classes 
  = Leader
  | SubLeader
  | Header
  | SubHeader
  | SubAltHeader
  | MinorHeader
  | Small
  | IndentParagraph
  | TextDefault
  | TextAccent
  | TextSecondary
  | TextSmall
  | TextDashed
  | Lowercase
  | Uppercase
  | Capital
  | AlignLeft
  | AlignRight
  | AlignJustify
  | AlignCenter
  | VAlignTop
  | VAlignBottom
  | VAlignBaseline
  | VAlignMiddle
  | VAlignSub
  | VAlignSuper
  | VAlignTopText
  | VAlignBottomText
  | PlaceRight