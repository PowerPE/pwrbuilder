#Define Install Function
function Install-PwrBuilder {
    ####################
    # Download Modules
    ####################
    ##########
    Write-Output "Installing PsGet"
    (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex    
    Import-Module PsGet
    ##########
    ##########
    Install-Module -ModuleUrl http://github.com/PowerPE/Show-UI/zipball/master -ModuleName ShowUI
    ##########
    Install-Module -ModuleUrl http://github.com/PowerPE/Show-UI_Ribbon/zipball/master -ModuleName Ribbon
    ##########
    Install-Module -ModuleUrl http://github.com/PowerPE/pwrbuilder/zipball/master -ModuleName PwrBuilder
    ##########
    Install-Module PsConfig 
    ##########
    Install-Module PsJson 
    ##########
    Install-Module PsEnv 
    ##########
    Install-Module PsWatch 
    ##########
    ####################
    #Check Permissions
    ####################
    ##########
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
        Import-Module -Name PwrBuilder
    }    
}

Install-PwrBuilder