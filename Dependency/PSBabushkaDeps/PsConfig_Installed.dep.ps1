#requires -version 3
<#
.SYNOPSIS
  PsConfig Dep

.DESCRIPTION
  Defines PsConfig Dependency

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
        -Name 'PsConfig-Installed' `
        -Met { Get-Module -Name PsConfig } `
        -Meet { 
            Log-Write -LogPath $sLogFile -LineValue "Installing - PsConfig (PwrBldr Modules)" 
            Install-Module PsConfig
        }
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrShowUI{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Checking PsConfig Dep"
  }
  
  Process{
    Try{
      Invoke-PSBabushka 'PsConfig-Installed'
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