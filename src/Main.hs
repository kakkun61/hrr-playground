module Main where

import Data.Int (Int32)
import Database.HDBC.Record (runQuery)
import Database.Relational.Query

import DataSource
import Table.Fruit (Fruit (..), fruit)
import qualified Table.Fruit as Fruit
import Table.MarketHistory (MarketHistory (..), marketHistory)
import qualified Table.MarketHistory as MarketHistory

main :: IO ()
main = do
    print selectHistory
    conn <- connect
    result <- runQuery conn (relationalQuery selectHistory) ()
    mapM_ print result
    result2 <- runQuery conn (relationalQuery selectNothing) ()
    print result2

selectHistory :: Relation () (Fruit, MarketHistory)
selectHistory = relation $ do
    f <- query fruit
    m <- query marketHistory
    on $ f ! Fruit.id' .=. m ! MarketHistory.product'
    return $ f >< m

selectNothing :: Relation () Fruit
selectNothing = relation $ do
    f <- query fruit
    wheres $ f ! id' .=. value 0
    return f
