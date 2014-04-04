#Define Install Function
function Install-PwrBuilder {
    #Stage 0
    $PwrBldrProgressTitle = "Installing PwrBuilder"
    Write-Progress -Activity $PwrBldrProgressTitle -PercentComplete -1
    #Stage 1 - Check Module Path
    Write-Progress -Activity $PwrBldrProgressTitle -Status "Checking" -CurrentOperation "Module Paths"
    $ModulePaths = @($Env:PSModulePath -split ';')
    $ExpectedUserModulePath = Join-Path -Path ([Environment]::GetFolderPath('MyDocuments')) -ChildPath WindowsPowerShell\Modules
    $Destination = $ModulePaths | Where-Object { $_ -eq $ExpectedUserModulePath}
    if (-not (Test-Path -Path $Destination)) {
        $Destination = $ModulePaths | Select-Object -Index 0
    }
    Write-Progress -Activity $PwrBldrProgressTitle -Status "Verifying" -CurrentOperation "Module Paths" -PercentComplete 25
    #Stage 2 - Create PwrBuilder Directory Structure
    Write-Progress -Activity $PwrBldrProgressTitle -Status "Creating" -CurrentOperation "PwrBuilder Directories"
    New-Item ($Destination + "\PwrBuilder\") -ItemType Directory -Force | out-null
    Write-Progress -Activity $PwrBldrProgressTitle -Status "Creating" -CurrentOperation "PwrBuilder Directories" -PercentComplete 50
    #Stage 3 - Download PwrBuilder Module
    Write-Progress -Activity $PwrBldrProgressTitle -Status "Downloading" -CurrentOperation "PwrBuilder Module"
    $webclient = New-Object System.Net.WebClient
    $url = "https://github.com/powerpe/pwrbuilder/raw/master/PwrBuilder.psm1"
    $file = "$Destination\PwrBuilder\PwrBuilder.psm1"
    $webclient.DownloadFile($url,$file)
    Write-Progress -Activity $PwrBldrProgressTitle -Status "Downloading" -CurrentOperation "PwrBuilder Module" -PercentComplete 75
    #Stage 4 - Check Permissions
    Write-Progress -Activity $PwrBldrProgressTitle -Status "Verifying" -CurrentOperation "PowerShell Execution Policy"    
    $executionPolicy  = (Get-ExecutionPolicy)
    $executionRestricted = ($executionPolicy -eq "Restricted")
    if ($executionRestricted){
        Write-Warning @"
Your execution policy is $executionPolicy, this means you will not be able to use PwrBuilder in an unattended mode.
To fix this change your execution policy to something like RemoteSigned.

        PS> Set-ExecutionPolicy RemoteSigned

For more information execute:
        
        PS> Get-Help about_execution_policies

"@
    }

    if (!$executionRestricted){
        Import-Module -Name $Destination\PwrBuilder
    }    
    Write-Host "PwrBuilder is installed and ready to use" -Foreground Green
}

Install-PwrBuilder