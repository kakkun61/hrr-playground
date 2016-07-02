{-# LANGUAGE TemplateHaskell #-}

module DataSource
  ( connect
  , defineTable
  ) where

import Database.HDBC.Query.TH (defineTableFromDB')
import Database.HDBC.MySQL
import Database.HDBC.Schema.MySQL (driverMySQL)
import Database.Relational.Query.Component (defaultConfig, normalizedTableName,
                                            identifierQuotation, IdentifierQuotation (Quotation))
import Database.Relational.Schema.MySQLInfo.Config (config)
import Language.Haskell.TH (Q, Dec)

connect :: IO Connection
connect = connectMySQL defaultMySQLConnectInfo { mysqlDatabase = "INFORMATION_SCHEMA" }

defineTable :: String -> Q [Dec]
defineTable tableName =
    defineTableFromDB'
        connect
        config { identifierQuotation = Quotation '`' }
        driverMySQL
        "tutorial"
        tableName
        [''Show]
