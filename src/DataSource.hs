{-# LANGUAGE TemplateHaskell #-}

module DataSource
  ( defineTable
  ) where

import Database.HDBC.Query.TH (defineTableFromDB')
import Database.HDBC.MySQL
import Database.HDBC.Schema.MySQL (driverMySQL)
import Database.Relational.Query.Component (defaultConfig, normalizedTableName,
                                            identifierQuotation, IdentifierQuotation (Quotation))
import Database.Relational.Schema.MySQLInfo.Config (config)
import Language.Haskell.TH (Q, Dec)

defineTable :: String -> Q [Dec]
defineTable tableName =
    defineTableFromDB'
        (connectMySQL defaultMySQLConnectInfo { mysqlDatabase = "INFORMATION_SCHEMA" })
        config { identifierQuotation = Quotation '`' }
        driverMySQL
        "tutorial"
        tableName
        [''Show]
