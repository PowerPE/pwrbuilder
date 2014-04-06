#Define Install Function
function Install-PwrBuilder {
    ####################
    # Modules
    ####################
    ##########
    if(-not (Get-Module -Name PsBabushka)) {
        Install-Module PSBabushka
    }
    ##########
    New-PSBabushkaDep `
        -Name 'ShowUI-Installed' `
        -Met { Get-Module -Name ShowUI } `
        -Meet { Install-Module -ModuleUrl http://github.com/PowerPE/Show-UI/zipball/master -ModuleName ShowUI }
    ##########
    New-PSBabushkaDep `
        -Name 'ShowUI_Ribbon-Installed' `
        -Met { Get-Module -Name Ribbon } `
        -Meet { Install-Module -ModuleUrl http://github.com/PowerPE/Show-UI_Ribbon/zipball/master -ModuleName Ribbon }
    ##########
    New-PSBabushkaDep `
        -Name 'PsConfig-Installed' `
        -Met { Get-Module -Name PsConfig } `
        -Meet { Install-Module PsConfig }
    ##########
    New-PSBabushkaDep `
        -Name 'PsJson-Installed' `
        -Met { Get-Module -Name PsJson } `
        -Meet { Install-Module PsJson }
    ##########
    New-PSBabushkaDep `
        -Name 'PsEnv-Installed' `
        -Met { Get-Module -Name PsEnv } `
        -Meet { Install-Module PsEnv }
    ##########
    New-PSBabushkaDep `
        -Name 'PsWatch-Installed' `
        -Met { Get-Module -Name PsWatch } `
        -Meet { Install-Module PsWatch }
    ##########
    New-PSBabushkaDep `
        -Name 'Autoload-Installed' `
        -Met { Get-Module -Name Autoload } `
        -Meet { Install-Module Autoload }
    ##########
    New-PSBabushkaDep `
        -Name 'PsUrl-Installed' `
        -Met { Get-Module -Name PsUrl } `
        -Meet { Install-Module PsUrl }
    ##########
    New-PSBabushkaDep `
        -Name 'PowerYaml-Installed' `
        -Met { Get-Module -Name PowerYaml } `
        -Meet { Install-Module PowerYaml }
    ##########
    Invoke-PSBabushka 'ShowUI-Installed'
    Invoke-PSBabushka 'ShowUI_Ribbon-Installed'
    Invoke-PSBabushka 'PsConfig-Installed'
    Invoke-PSBabushka 'PsJson-Installed'
    Invoke-PSBabushka 'PsEnv-Installed'
    Invoke-PSBabushka 'PsWatch-Installed'
    Invoke-PSBabushka 'Autoload-Installed'
    Invoke-PSBabushka 'PsUrl-Installed'
    Invoke-PSBabushka 'PowerYaml-Installed'
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