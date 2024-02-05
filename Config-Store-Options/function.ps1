function ParseINI {
    param($path)
    $config = @{}
    switch -regex (Get-Content -Path $path) {
        "^;|^\s*$" { continue }
        "^\[([^\]]+)\]\s*$" {
            $currenthive = $Matches[1].trim(); $config.$currenthive = @{}; continue
        }
        "^([^=]+)=(.*)$" {
            $valuename = $Matches[1].trim()
            $values = $Matches[2].trim().Split(',') | Where-Object { $_ -ne '' } | ForEach-Object { $_.trim() }
            $config.$currenthive.$valuename = $values
            continue
        }
        "^\s*(.+)$" {
            $values = $Matches[1].trim() -split ",\s*" | Where-Object { $_ -and $_.trim() } | ForEach-Object { $_.trim() }
            $config.$currenthive.$valuename += $values
            continue
        }
        default {
            Write-Error "Unknown line: '$_'"
        }
    }
    $config
}
    
$PSConfigIni = ParseINI -path D:\Course\config.ini
$PSConfigIni
    
# Config based on XML file
$PSConfigXML = [xml] (Get-Content D:\Course\config.xml)
$PSConfigXML
    
# Config based on JSON
$PSConfigJSON = Get-Content -Path D:\Course\config.json | ConvertFrom-Json
$PSConfigJSON
    
# Config based on Hashtable
$PSConfigPSD1 = Import-PowerShellDataFile -Path D:\Course\Config.PSD1
$PSConfigPSD1