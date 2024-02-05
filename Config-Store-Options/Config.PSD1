@{
    # This is a comment row
    SQLServerData  = @{
        ServerName = "WS2019SQL"
        IP         = "192.168.1.1"
    }
    
    <# 
        This is a multi line comment
    #>
    
    DBData         = @{
        Database = "MigrationData"
        Table    = "Users"
        Columns  = ("Name", "Someaccountname", "Department")
        Orgs     = ("Marketing", "Sales", "Manufacturing",
            "Finance", "Engineering")
    }
    
    AdditionalData = @{
        Number = 123
        Date   = { [datetime] "2024.02.06" }
    }
}