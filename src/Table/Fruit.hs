{-# LANGUAGE TemplateHaskell, MultiParamTypeClasses, FlexibleInstances #-}

module Table.Fruit where

import DataSource (defineTable)

$(defineTable "fruit")
