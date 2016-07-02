{-# LANGUAGE TemplateHaskell, MultiParamTypeClasses, FlexibleInstances #-}

module Table.MarketHistory where

import DataSource (defineTable)

$(defineTable "market_history")
