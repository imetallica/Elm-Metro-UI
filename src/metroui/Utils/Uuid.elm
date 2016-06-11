module MetroUi.Utils.Uuid exposing ( genUuid )

{-| This module generates random UUIDs for the components.
It uses the Barebones module from danyx23/elm-uuid package
for the generation, but using Elm's Random module.

First, you need to generate a Uuid, using the function:

    genUuid Msg == Generator String

Where the Msg is an message to be patterned match upon on your
update function.

-}

import String
import List
import Array
import Char
import Regex
import Bitwise
import Random exposing (Generator, map, list, int, step, Seed)

genUuid : (String -> a) -> (Cmd a)
genUuid msg =
  Random.generate msg uuidStringGenerator

{-| Random Generator for Uuid Strings.
-}
uuidStringGenerator : Generator String
uuidStringGenerator =
  map toUuidString (list 31 hexGenerator)


{-| Verification function to check if the given string is a valid Uuid in the canonical
representation xxxxxxxx-xxxx-Axxx-Yxxx-xxxxxxxxxxxx where A is the version number between
[1-5] and Y is in the range [8-B]
-}
isValidUuid : String -> Bool
isValidUuid uuidAsString =
  Regex.contains uuidRegex uuidAsString


{- Create a valid V4 Uuid from a list of 31 hex values. The final
 Uuid has 32 hex characters with 4 seperators. One of the characters
 is fixed to 4 to indicate the version, and one is limited to the range
 [8-B] (indicated with Y in the sample string):
 xxxxxxxx-xxxx-4xxx-Yxxx-xxxxxxxxxxxx
-}
toUuidString : List Int -> String
toUuidString thirtyOneHexDigits =
  String.concat
    [ thirtyOneHexDigits |> List.take 8 |> (List.map mapToHex) |> String.fromList
    , "-"
    , thirtyOneHexDigits |> List.drop 8 |> List.take 4 |> (List.map mapToHex) |> String.fromList
    , "-"
    , "4"
    , thirtyOneHexDigits |> List.drop 12 |> List.take 3 |> (List.map mapToHex) |> String.fromList
    , "-"
    , thirtyOneHexDigits |> List.drop 15 |> List.take 1 |> (List.map limitDigitRange8ToB) |> (List.map mapToHex) |> String.fromList
    , thirtyOneHexDigits |> List.drop 16 |> List.take 3 |> (List.map mapToHex) |> String.fromList
    , "-"
    , thirtyOneHexDigits |> List.drop 19 |> List.take 12 |> (List.map mapToHex) |> String.fromList
    ]


limitDigitRange8ToB : Int -> Int
limitDigitRange8ToB digit =
  digit `Bitwise.and` 3 `Bitwise.or` 8


uuidRegex : Regex.Regex
uuidRegex =
  Regex.regex "^[0-9A-Fa-f]{8,8}-[0-9A-Fa-f]{4,4}-[1-5][0-9A-Fa-f]{3,3}-[8-9A-Ba-b][0-9A-Fa-f]{3,3}-[0-9A-Fa-f]{12,12}$"


hexDigits : Array.Array Char
hexDigits =
  let
    mapChars offset digit =
        Char.fromCode <| digit + offset
  in
    (List.map (mapChars 48) [0..9])
      ++ (List.map (mapChars 97) [0..5])
      |> Array.fromList



{- Map an integer in the range 0-15 to a hexadecimal character -}


mapToHex : Int -> Char
mapToHex index =
  let
    maybeResult =
      (flip Array.get <| hexDigits) index
  in
    case maybeResult of
      Nothing ->
          'x'

      Just result ->
          result


hexGenerator : Generator Int
hexGenerator =
  int 0 15

