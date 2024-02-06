#region Functions
function ParseConfig {
    param(
        $path = "$($PSScriptFullPath).psd1"
    )
    function ResolveDynamicData {
        param([hashtable] $confighive)

            foreach($key in $confighive)
    }   

    $PSConfig = Import-PowerShellDataFile -Path $path 

    ResolveDynamicData -confighive $PSConfig

    $PSConfig
}

#endregion

$PSScriptFullPath = $MyInvocation.MyCommand.path
$PSConfig = ParseConfig -path