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
$ErrorActionPreference = "Stop"
       
#----------------------------------------------------------[Declarations]----------------------------------------------------------


#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
Function Install-PwrBldr{
  Param()
  
  Begin{
    
    Write-Output "Installing PwrBuilder (PwrBldr)..."
  }
  
  Process{
    Try{
      if (-not (Get-Command -Module 'PsGet')) {
        Echo 'Installing/Updating PsGet...'
        (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
      }
      if (-not (Get-Command -Module 'PwrBldr')) {
        Install-Module -ModuleUrl https://github.com/PowerPE/pwrbuilder/archive/master.zip -ModuleName PwrBldr
      }
    
    }
    
    Catch{
      Write-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Write-Output -LogPath $sLogFile -LineValue "Installing PwrBuilder - Completed Successfully."
      Write-Output -LogPath $sLogFile -LineValue " "
    }
  }
}
#>
 
#-----------------------------------------------------------[Execution]------------------------------------------------------------
 
Install-PwrBldr
Install-PwrBldrDeps