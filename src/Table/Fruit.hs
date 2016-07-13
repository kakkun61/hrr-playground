{-# LANGUAGE TemplateHaskell, MultiParamTypeClasses, FlexibleInstances #-}

module Table.Fruit where

import DataSource (defineTable)
import Database.Relational.Query hiding (id')
import Database.HDBC.Query.TH (makeRecordPersistableDefault)
import qualified GHC.Int

$(defineTable "fruit")

data Fruit' = Fruit' String GHC.Int.Int32

$(makeRecordPersistableDefault ''Fruit')

insertFruit' :: Insert Fruit'
insertFruit' = typedInsert tableOfFruit ((Fruit' |$| name' |*| price') :: Pi Fruit Fruit')
