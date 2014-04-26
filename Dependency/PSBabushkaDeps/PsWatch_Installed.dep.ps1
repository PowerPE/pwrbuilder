#requires -version 3
<#
.SYNOPSIS
  PsWatch Dep

.DESCRIPTION
  Defines PsWatch Dependency

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
        -Name 'PsWatch-Installed' `
        -Met { Get-Module -Name PsWatch } `
        -Meet {
            Log-Write -LogPath $sLogFile -LineValue "Installing - ShowUI (PwrBldr Modules)" 
            Install-Module PsWatch 
        }
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrPsWatch{
  
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

#Install-PwrBldrPsWatch

#>