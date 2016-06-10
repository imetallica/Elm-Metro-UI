module MetroUi.Css.FlexGrid exposing ( class, Classes(..) )
import String
import List
import Html.Attributes as Attr

type Classes 
  = FlexGrid
  | Row
  | Cell
  | Size2
  | Size3
  | Size4
  | Size5
  | Size6
  | Size7
  | Size8
  | Size9
  | Size10
  | Size11
  | Size12
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
  | Sizep10
  | Sizep20
  | Sizep30
  | Sizep40
  | Sizep50
  | Sizep60
  | Sizep70
  | Sizep80
  | Sizep90
  | Sizep100
  | Sizex100
  | Sizex200
  | Sizex300
  | Sizex400
  | Sizex500
  | Sizex600
  | Sizex700
  | Sizex800
  | Sizex900
  | Sizex1000
  | CellAutoSize
  | AutoSize
  | FlexDirRow
  | FlexDirRowReverse
  | FlexDirColumn
  | FlexDirColumnReverse
  | FlexWrap
  | FlexWrapReverse
  | FlexNoWrap
  | FlexJustStart
  | FlexJustEnd
  | FlexJustCenter
  | FlexJustSa
  | FlexJustSb
  | FlexAlignStretch
  | FlexAlignStart
  | FlexAlignEnd
  | FlexAlignCenter
  | FlexAlignBase
  | FlexContentStretch
  | FlexContentStart
  | FlexContentEnd
  | FlexContentCenter
  | FlexContentBase
  | FlexContentSa
  | FlexContentSb
  | FlexSelfAuto
  | FlexSelfStart
  | FlexSelfEnd
  | FlexSelfCenter
  | FlexSelfBase
  | FlexSelfStretch
  | NoShrink
  | NoGrow

class styles =
  Attr.classList (List.map transformStyleIntoTuple styles)

transformStyleIntoTuple style =
  case style of
    FlexGrid -> ( "flex-grid", True )
    Sizep10 -> ( "size-p10", True )
    Sizep20 -> ( "size-p20", True )
    Sizep30 -> ( "size-p30", True )
    Sizep40 -> ( "size-p40", True )
    Sizep50 -> ( "size-p50", True )
    Sizep60 -> ( "size-p60", True )
    Sizep70 -> ( "size-p70", True )
    Sizep80 -> ( "size-p80", True )
    Sizep90 -> ( "size-p90", True )
    Sizep100 -> ( "size-p100", True )
    Sizex100 -> ( "size-x100", True )
    Sizex200 -> ( "size-x200", True )
    Sizex300 -> ( "size-x300", True )
    Sizex400 -> ( "size-x400", True )
    Sizex500 -> ( "size-x500", True )
    Sizex600 -> ( "size-x600", True )
    Sizex700 -> ( "size-x700", True )
    Sizex800 -> ( "size-x800", True )
    Sizex900 -> ( "size-x900", True )
    Sizex1000 -> ( "size-x1000", True )
    CellAutoSize -> ( "cell-auto-size", True )
    AutoSize -> ( "auto-size", True )
    FlexDirRow -> ( "flex-dir-row", True )
    FlexDirRowReverse -> ( "flex-dir-row-reverse", True )
    FlexDirColumn -> ( "flex-dir-column", True )
    FlexDirColumnReverse -> ( "flex-dir-column-reverse", True )
    FlexWrap -> ( "flex-wrap", True )
    FlexWrapReverse -> ( "flex-wrap-reverse", True )
    FlexNoWrap -> ( "flex-no-wrap", True )
    FlexJustStart -> ( "flex-just-start", True )
    FlexJustEnd -> ( "flex-just-end", True )
    FlexJustCenter -> ( "flex-just-center", True )
    FlexJustSa -> ( "flex-just-sa", True )
    FlexJustSb -> ( "flex-just-sb", True )
    FlexAlignStretch -> ( "flex-align-stretch", True )
    FlexAlignStart -> ( "flex-align-start", True )
    FlexAlignEnd -> ( "flex-align-end", True )
    FlexAlignCenter -> ( "flex-align-center", True )
    FlexAlignBase -> ( "flex-align-base", True )
    FlexContentStretch -> ( "flex-content-stretch", True )
    FlexContentStart -> ( "flex-content-start", True )
    FlexContentEnd -> ( "flex-content-end", True )
    FlexContentCenter -> ( "flex-content-center", True )
    FlexContentBase -> ( "flex-content-base", True )
    FlexContentSa -> ( "flex-content-sa", True )
    FlexContentSb -> ( "flex-content-sb", True )
    FlexSelfAuto -> ( "flex-self-auto", True )
    FlexSelfStart -> ( "flex-self-start", True )
    FlexSelfEnd -> ( "flex-self-end", True )
    FlexSelfCenter -> ( "flex-self-center", True )
    FlexSelfBase -> ( "flex-self-base", True )
    FlexSelfStretch -> ( "flex-self-stretch", True )
    NoShrink -> ( "no-shrink", True )
    NoGrow -> ( "no-grow", True )
    _ -> (transformToString style, True)


transformToString : Classes -> String
transformToString t =
  (toString t) |> String.toLower

{-  
  | Row
  | Cell
  | Size2
  | Size3
  | Size4
  | Size5
  | Size6
  | Size7
  | Size8
  | Size9
  | Size10
  | Size11
  | Size12
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
-}