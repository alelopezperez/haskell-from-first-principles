import Data.Time

data DatabaseItem
    = DbString String
    | DbNumber Integer
    | DbDate
        UTCTime
    deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate
        ( UTCTime
            (fromGregorian 1911 5 1)
            (secondsToDiffTime 34123)
        )
    , DbNumber 9001
    , DbNumber 1
    , DbString "Hello, world!"
    , DbDate
        ( UTCTime
            (fromGregorian 1921 5 1)
            (secondsToDiffTime 34123)
        )
    ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate =
    foldr
        ( \x y -> case x of
            DbDate t -> t : y
            _ -> y
        )
        []

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber =
    foldr
        ( \x y -> case x of
            DbNumber t -> t : y
            _ -> y
        )
        []

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent x = foldr max (UTCTime (ModifiedJulianDay 0) 0) (filterDbDate x)

sumDb :: [DatabaseItem] -> Integer
sumDb = foldr (+) 0 . filterDbNumber

avgDb :: [DatabaseItem] -> Double
avgDb x = fromIntegral (sumDb x) / fromIntegral (length $ filterDbNumber x)
