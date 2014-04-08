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
$ErrorActionPreference = "Stop"
 
#Dot Source required Function Libraries
. "$PSScriptRoot\Diagnostic\Logging_Functions.ps1"
. "$PSScriptRoot\Deps\Directories.dep.ps1"
. "$PSScriptRoot\Deps\pwrbldr.dep.ps1"
       
#----------------------------------------------------------[Declarations]----------------------------------------------------------
 
#Script Version
$sScriptVersion = "0.1"
 
#Log File Info
$sLogPath = $env:USERPROFILE + "\PowerShell\PwrBuilder\log"
$sLogName = "Install.log"
$sLogFile = $sLogPath + "\" + $sLogName

#Dep Dir
$PwrBldrDeps = $PwrBldrModuleRoot + "\Deps"

#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
Function Install-PwrBldr{
  
  Begin{
    
    Log-Write -LogPath $sLogFile -LineValue "Installing PwrBuilder"
  }
  
  Process{
    Try{
      Install-PwrBldrDirectories
      Install-PwrBldrDeps
      
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
      Log-Write -LogPath $sLogFile -LineValue "Installing PwrBuilder - Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}
#>
 
#-----------------------------------------------------------[Execution]------------------------------------------------------------
 
Log-Start -LogPath $sLogPath -LogName $sLogName -ScriptVersion $sScriptVersion
Install-PwrBldr
Log-Finish -LogPath $sLogFile