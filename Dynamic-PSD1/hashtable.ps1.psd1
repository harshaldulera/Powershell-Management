@{
    # This section is used by this specific script
    ScriptConfig = @{
        textValue = "SomeText"
        date = {[datetime] "2024.02.06"}
        bool = $true
    }

    # This should be shared between other scripts
    AccessToRESTApi = @{
        AppId = ''
        Token = ''
        ApiURL = ''
    }

    # This is a default settings for all scripts
    LogSettings = @{
        LogFolder = {Join-Path $PSScriptRoot Logs}
    }
}