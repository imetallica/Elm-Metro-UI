module MetroUi.Css.SimpleGrid exposing ( Classes(..), class )
import String
import List
import Html.Attributes as Attr

type Classes
  = Grid
  | Row
  | Cell
  | Cells2
  | Cells3
  | Cells4
  | Cells5
  | Cells6
  | Cells7
  | Cells8
  | Cells9
  | Cells10
  | Cells11
  | Cells12
  | Condensed
  | Colspan2
  | Colspan3
  | Colspan4
  | Colspan5
  | Colspan6
  | Colspan7
  | Colspan8
  | Colspan9
  | Colspan10
  | Colspan11
  | Colspan12

class styles =
  Attr.classList (List.map transformStyleIntoTuple styles)

transformStyleIntoTuple style =
  (transformToString style, True)

transformToString : Classes -> String
transformToString t =
  (toString t) |> String.toLower
