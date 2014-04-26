#requires -version 3
<#
.SYNOPSIS
  ShowUI Dep

.DESCRIPTION
  Defines ShowUI Dependency

.PARAMETER Name
    Dep Name
.PARAMETER Met
    Test if Dep is met
.PARAMETER Meet
    Meet Dep

.NOTES
  Version:        1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>

#----------------------------------------------------------[Declarations]----------------------------------------------------------
New-PSBabushkaDep `
        -Name 'ShowUI-Installed' `
        -Met { Get-Module -Name ShowUI } `
        -Meet { 
            Log-Write -LogPath $sLogFile -LineValue "Installing - ShowUI (PwrBldr Modules)" 
            Install-Module -ModuleUrl http://github.com/PowerPE/Show-UI/zipball/master -ModuleName ShowUI
        }
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrShowUI{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Checking ShowUI Dep"
  }
  
  Process{
    Try{
      Invoke-PSBabushka 'ShowUI-Installed'
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

#-----------------------------------------------------------[Execution]------------------------------------------------------------

#Install-PwrBldrShowUI

#>