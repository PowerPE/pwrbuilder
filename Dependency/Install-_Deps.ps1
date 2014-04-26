#requires -version 2
<#
.SYNOPSIS
  Install PwrBuilder Deps
 
.DESCRIPTION
  Installer for PwrBuilder Dependencies
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
#---------------------------------------------------------[Initialisations]--------------------------------------------------------
 
#Set Environment variables
$ErrorActionPreference = "SilentlyContinue"
 
#Dot Source required Function Libraries
. "$PSScriptRoot\..\Diagnostic\Logging_Functions.ps1" 
 
#----------------------------------------------------------[Declarations]----------------------------------------------------------
 
#Set Script variables
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
 
<#
 
Function Install-<Title>Deps{
  Param()
    Write-Output 'Install of <Title> Dependencies started...'
  Begin{
    
  }
  
  Process{
    Try{
      if(-not (Get-Command -Module 'PsBabushka')) {
        Install-Module -ModuleUrl https://github.com/PowerPE/PSBabushka/archive/master.zip -ModuleName PsBabushka
      } 

      #Invoke all dep scripts
      Get-ChildItem "${PSScriptRoot}\*.dep.ps1" | %{.$_} 
    }
    
    Catch{
      Write-Error $_.Exception
      Break
    }
  }
  
  End{
    If($?){
      Write-Output 'Install of <Title> Dependencies complete.'
    }
  }
}
 
#>