#requires -version 3
<#
.SYNOPSIS
  PwrBuilder Installer
 
.DESCRIPTION
  PwrBuilder Module Installer
    
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
#---------------------------------------------------------[Initialisations]--------------------------------------------------------
$ErrorActionPreference = "Continue"
       
#----------------------------------------------------------[Declarations]----------------------------------------------------------
#---[Settings - Module]---
$pwrinst_PSModule = "pwrbldr"
$pwrinst_PSModuleUrl = "https://github.com/PowerPE/pwrbuilder/archive/master.zip"

#---[Settings - Installer]---
$pwrinst_InstTitle = "Installing $pwrinst_PSModule ..."
$pwrinst_InstComplete = "Installing $pwrinst_PSModule Complete"

#-----------------------------------------------------------[Functions]-----------------------------------------------------
Function Invoke-Install{
  Param()

  Begin{
    Write-Host $pwrinst_InstTitle
  }

  Process{
    Try{
      if (-not (Get-Command -Module 'PsGet')) {
        Echo 'Installing/Updating PsGet...'
        (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
      }
      if (-not (Get-Command -Module $pwrinst_PSModule)) {
        Install-Module -ModuleUrl $pwrinst_PSModuleUrl -ModuleName $pwrinst_PSModule
      }
    }
    
    Catch{
      Write-Error `$_.Exception
      Break
    }
  }

  End{
    If($?){
      Write-Output $pwrinst_InstComplete
      Write-Output " "
    }
  }
}
   
#-----------------------------------------------------------[Execution]------------------------------------------------------------
 
Invoke-Expression $pwrinst_dyninst
#Invoke-Expression "Install-$pwrinst_PSModule`Deps"