{-# LANGUAGE FlexibleContexts #-}
module Main where

import Data.List
import Data.Either
import Control.Monad
import Text.Parsec
import Data.Time
import System.Locale
{-
vrachy -- breve
macron -- macron
varia -- grave
oxia -- acute
perispomeni -- curve
dialytika -- diaeresis
dasia -- aspilated
psili -- unaspilated
ypogegrammeni -- iota subscriptum
prosgegrammeni --  iota adscriptum
-}

data Length = Vrachy | Macron
    deriving (Read, Show, Eq)
data Accent = Oxia | Varia | Perispomeni
    deriving (Read, Show, Eq)
data Aspiration = Dasia | Psili
    deriving (Read, Show, Eq)

data Diacritic = Diarkia Length
               | Tonos Accent
               | Pneuma Aspiration
               | Ypogegrammeni
               | Prosgegrammeni
               | Dialytika
    deriving (Read, Show, Eq)

type Diacritics = (Maybe Length, Maybe Accent, Maybe Aspiration, Bool, Bool)

lengthKey :: Length -> String
lengthKey Vrachy = "^"
lengthKey Macron = "-"

preAccentKey :: Accent -> String
preAccentKey Oxia = ";"
preAccentKey Varia = "`"
preAccentKey Perispomeni = "~"

postAccentKey :: Accent -> String
postAccentKey Oxia = "/"
postAccentKey Varia = "\\\\"
postAccentKey Perispomeni = "="

preAspirationKey :: Aspiration -> String
preAspirationKey Dasia = "<"
preAspirationKey Psili = ">"

postAspirationKey :: Aspiration -> String
postAspirationKey Dasia = "["
postAspirationKey Psili = "]"

ypogegrammeniKey :: String
ypogegrammeniKey = "|"

preDialytikaKey :: String
preDialytikaKey = ":"

postDialytikaKey :: String
postDialytikaKey = "\""

preamble :: FormatTime t => t -> [String]
preamble date = [ "\" Maintainer:\tSakamoto Noriaki <mrty.ityt.pt@gmail.com>"
                , "\" Last Changed:\t" ++ formatTime defaultTimeLocale "%Y %b %e" date
                , ""
                , "let b:keymap_name = \"Polytoniko\""
                , ""
                , "loadkeymap"
                ] ++ map  (\(s,c,d)-> keymapLine c s d) moreKeymap

moreKeymap :: [(String, String, String)]
moreKeymap = [ ("Q",    "003A", "COLON")
             , ("q",    "037E", "GREEK QUESTION MARK")
             , (";.",   "0387", "GREEK ANO TELEIA")
             , ("'",    "1FBD", "GREEK APOSTROFOS")
             , (">>",   "00BB", "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
             , (";>",   "00BB", "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
             , ("<<",   "00AB", "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
             , (";<",   "00AB", "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
             , ("--",   "2013", "EN DASH")
             , ("---",  "2014", "EM DASH")
             , (";#",   "0374", "GREEK NUMERAL SIGN")
             , (";##",  "0375", "GREEK LOWER NUMERAL SIGN")
             , ("&&",   "03D7", "Abbreviated kai")
             , (">,",   "0313", "COMBINING COMMA ABOVE")
             , ("<,",   "0314", "COMBINING REVERSED COMMA ABOVE")
             ]

uniq :: (Eq a)=>[a] -> [a]
uniq [] = []
uniq (z:zs) = uniq' z zs
    where
      uniq' x [] = [x]
      uniq' x (y:ys) | x == y     = uniq' x ys
                     | otherwise  = x : uniq' y ys

accentiate :: Diacritics -> String -> [String]
accentiate (len, acc, asp, yp, dl) x = uniq . sort $ map concat [ [x, l, xd, xa, xc, y]
                                                                , [x, xd, xa, xc, y, l]
                                                                , [x, xd, xc, xa, y, l]
                                                                , [dx, x, l, xa, xc, y]
                                                                , [dx, x, xa, xc, y, l]
                                                                , [dx, ax, x, l, xc, y]
                                                                , [dx, ax, x, xc, y, l]
                                                                , [ax, dx, x, l, xc, y]
                                                                , [ax, dx, x, xc, y, l]
                                                                , [ax, dx, cx, x, l, y]
                                                                , [ax, dx, cx, x, y, l]
                                                                , [ax, cx, dx, x, l, y]
                                                                , [ax, cx, dx, x, y, l]
                                                                --, [a, c, d, l, x, y]
                                                                --, [a, d, c, l, x, y]
                                                                ]
  where
    l = maybe "" lengthKey len
    cx = maybe "" preAccentKey acc
    xc = maybe "" postAccentKey acc
    ax = maybe "" preAspirationKey asp
    xa = maybe "" postAspirationKey asp
    y = if yp then ypogegrammeniKey else ""
    dx = if dl then preDialytikaKey else ""
    xd = if dl then postDialytikaKey else ""

greekLetterKeys :: [(String, (String, String))]
greekLetterKeys = [ ("ALPHA",   ("a", "A"))
                  , ("BETA",    ("b", "B"))
                  , ("GAMMA",   ("g", "G"))
                  , ("DELTA",   ("d", "D"))
                  , ("EPSILON", ("e", "E"))
                  , ("DIGAMMA", ("qf", "Qf"))
                  , ("PAMPHYLIAN DIGAMMA", ("qv", "Qv"))
                  , ("ZETA",    ("z", "Z"))
                  , ("ETA",     ("h", "H"))
                  , ("HETA",    ("qh", "Qh"))
                  , ("THETA",   ("u", "U"))
                  , ("IOTA",    ("i", "I"))
                  , ("KAPPA",   ("k", "K"))
                  , ("LAMDA",   ("l", "L"))
                  , ("MU",      ("m", "M"))
                  , ("NU",      ("n", "N"))
                  , ("XI",      ("j", "J"))
                  , ("OMICRON", ("o", "O"))
                  , ("PI",      ("p", "P"))
                  , ("SAN",     ("qs", "Qs"))
                  , ("SHO",     ("qx", "Qx"))
                  , ("KOPPA",   ("qq", "Qq"))
                  , ("ARCHAIC KOPPA", ("qg", "Qg"))
                  , ("RHO",     ("r", "R"))
                  , ("SIGMA",   ("s", "S"))
                  , ("FINAL SIGMA", ("w", undefined))
                  , ("TAU",     ("t", "T"))
                  , ("UPSILON", ("y", "Y"))
                  , ("PHI",     ("f", "F"))
                  , ("CHI",     ("x", "X"))
                  , ("PSI",     ("c", "C"))
                  , ("OMEGA",   ("v", "V"))
                  , ("SAMPI",   ("qt", "Qt"))
                  , ("ARCHAIC SAMPI", ("qu", "Qu"))
                  , ("STIGMA", ("qj", "Qj"))
                  , ("YOT", (undefined, "qy"))
                  ]

parseAccent :: (Stream s m Char) => ParsecT s u m Accent
parseAccent = foldl1 (<|>) [ string "OXIA"        >> return Oxia
                           , string "VARIA"       >> return Varia
                           , string "PERISPOMENI" >> return Perispomeni
                           ]

parseAspiration :: (Stream s m Char) => ParsecT s u m Aspiration
parseAspiration = foldl1 (<|>) [ string "DASIA"   >> return Dasia
                               , string "PSILI"   >> return Psili
                               ]

parseLength :: (Stream s m Char) => ParsecT s u m Length
parseLength = foldl1 (<|>) [ string "VRACHY"   >> return Vrachy
                           , string "MACRON"   >> return Macron
                           ]

parseDiaeresis :: (Stream s m Char) => ParsecT s u m Diacritic
parseDiaeresis = string "DIALYTIKA"   >> return Dialytika

parseIota :: (Stream s m Char) => ParsecT s u m Diacritic
parseIota = foldl1 (<|>) [ string "YPOGEGRAMMENI"   >> return Ypogegrammeni
                         , string "PROSGEGRAMMENI"   >> return Prosgegrammeni
                         ]

parseGreekDiacritics :: (Stream s m Char) => ParsecT s u m Diacritic
parseGreekDiacritics = foldl1 (<|>) [ liftM Tonos $ try parseAccent
                                    , liftM Pneuma $ try parseAspiration
                                    , liftM Diarkia $ try parseLength
                                    , parseDiaeresis
                                    , parseIota
                                    ]

parseWith :: (Stream s m Char) => ParsecT s u m a -> ParsecT s u m [a]
parseWith p = do
    string "WITH "
    x <- p
    xs <- many (string " AND " >> p)
    return $ x:xs

parseGreekLetter :: (Stream s m Char) => ParsecT s u m (Bool, String, Diacritics)
parseGreekLetter = do
    string "GREEK " 
    small <- (string "SMALL " >> return True) <|> (string "CAPITAL " >> return False) <|> return False
    string "LETTER "
    name <- foldl1 (<|>) $ map (try . (\(n,_)-> string n)) greekLetterKeys
    dcs <- (string " " >> parseWith parseGreekDiacritics) <|> return []
    return (small, name, normalizeDiacritics dcs)

normalizeDiacritics' :: Diacritics -> [Diacritic] -> Diacritics
normalizeDiacritics' t [] = t
normalizeDiacritics' (_, ac, asp, i, d) (Diarkia l@_:dcs)        = normalizeDiacritics' (Just l, ac, asp, i, d) dcs
normalizeDiacritics' (l,  _, asp, i, d) (Tonos ac@_:dcs)         = normalizeDiacritics' (l, Just ac, asp, i, d) dcs
normalizeDiacritics' (l, ac,   _, i, d) (Pneuma asp@_:dcs)       = normalizeDiacritics' (l, ac, Just asp, i, d) dcs
normalizeDiacritics' (l, ac, asp, _, d) (Ypogegrammeni:dcs)      = normalizeDiacritics' (l, ac, asp, True, d) dcs
normalizeDiacritics' (l, ac, asp, _, d) (Prosgegrammeni:dcs)     = normalizeDiacritics' (l, ac, asp, True, d) dcs
normalizeDiacritics' (l, ac, asp, i, _) (Dialytika:dcs)          = normalizeDiacritics' (l, ac, asp, i, True) dcs

normalizeDiacritics :: [Diacritic] -> Diacritics
normalizeDiacritics = normalizeDiacritics' (Nothing, Nothing, Nothing, False, False)

letterKeySequence :: Bool -> String -> Diacritics -> Maybe [String]
letterKeySequence small name dcs = liftM (accentiate dcs) key
    where
      lukey = lookup name greekLetterKeys
      key = liftM (if small then fst else snd) lukey

parseUnicodeDataLine :: (Stream s m Char) => ParsecT s u m (String, String)
parseUnicodeDataLine = do
    code <- many hexDigit
    string ";"
    desc <- many (notFollowedBy (string ";") >> anyChar)
    string ";"
    many (notFollowedBy newline >> anyChar)
    return (code, desc)

convertDescToKeySequence :: (Stream s m Char) => ParsecT s u m (Maybe [String])
convertDescToKeySequence = foldl1 (<|>) [ parseGreekLetter >>= \(small, name, dcs)-> return $ letterKeySequence small name dcs
                                        ]

keymapLine :: String -> String -> String -> String
keymapLine c s d = intercalate "\t" [s, "<char-0x" ++ c ++ ">", "\" " ++ d]

convertLineToKeymap :: (Stream s m Char) => ParsecT s u m [String]
convertLineToKeymap = do
    (code, desc) <- parseUnicodeDataLine
    key <- either (const $ parserFail "description") return $ parse convertDescToKeySequence "description to key sequence" desc
    maybe parserZero (return . map (flip (keymapLine code) desc)) key

main :: IO ()
main = do
    date <- getCurrentTime
    ud <- readFile "UnicodeData.txt"
    let kms = concat . rights $ map (runParser convertLineToKeymap () "UnicodeData") $ lines ud
    writeFile "keymap/pgreek_utf-8.vim" $ unlines $ preamble date ++ kms

