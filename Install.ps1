#requires -version 3
<#
.SYNOPSIS
  PwrBuilder Installer
 
.DESCRIPTION
  PwrBuilder Module Installer
   
.OUTPUTS
  Log file stored in $env:UserProfile\Pwrbuilder\log\
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
#---------------------------------------------------------[Initialisations]--------------------------------------------------------
 
#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"
 
#Dot Source required Function Libraries
. "$PSScriptRoot\Diagnostics\Logging_Functions.ps1"
 
#----------------------------------------------------------[Declarations]----------------------------------------------------------
 
#Script Version
$sScriptVersion = "0.1"
 
#Log File Info
$sLogPath = "$env:UserProfile\PowerShell\PwrBuilder\log"
$sLogName = "Install.log"
$sLogFile = $sLogPath + "\" + $sLogName
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
Function Install-PwrBuilder{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Install PwrBuilder"
  }
  
  Process{
    Try{
      if(-not (Get-Module -Name PsBabushka)) {
        Install-Module PSBabushka
      }
      . "$PSScriptRoot\Deps\ShowUI_Installed.dep.ps1"
      . "$PSScriptRoot\Deps\ShowUI_Ribbon_Installed.dep.ps1"
      . "$PSScriptRoot\Deps\PsConfig_Installed.dep.ps1"
      . "$PSScriptRoot\Deps\PsJson_Installed.dep.ps1"
      . "$PSScriptRoot\Deps\PsEnv_Installed.dep.ps1"
      . "$PSScriptRoot\Deps\PsWatch_Installed.dep.ps1"
      . "$PSScriptRoot\Deps\PsUrl_Installed.dep.ps1"
      . "$PSScriptRoot\Deps\PowerYaml_Installed.dep.ps1"
      . "$PSScriptRoot\Deps\Autoload_Installed.dep.ps1"
      Invoke-PSBabushka 'ShowUI-Installed'
      Invoke-PSBabushka 'ShowUI_Ribbon-Installed'
      Invoke-PSBabushka 'PsConfig-Installed'
      Invoke-PSBabushka 'PsJson-Installed'
      Invoke-PSBabushka 'PsEnv-Installed'
      Invoke-PSBabushka 'PsWatch-Installed'
      Invoke-PSBabushka 'Autoload-Installed'
      Invoke-PSBabushka 'PsUrl-Installed'
      Invoke-PSBabushka 'PowerYaml-Installed'
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
    
    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}
 
#>
 
#-----------------------------------------------------------[Execution]------------------------------------------------------------
 
Log-Start -LogPath $sLogPath -LogName $sLogName -ScriptVersion $sScriptVersion
Install-PwrBuilder
Log-Finish -LogPath $sLogFile