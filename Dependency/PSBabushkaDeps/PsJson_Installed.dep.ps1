#requires -version 3
<#
.SYNOPSIS
  PsJson Dep

.DESCRIPTION
  Defines PsJson Dependency

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
        -Name 'PsJson-Installed' `
        -Met { Get-Module -Name PsJson } `
        -Meet { 
            Log-Write -LogPath $sLogFile -LineValue "Installing - PsJson (PwrBldr Modules)" 
            Install-Module PsJson
        }
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrPsJson{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Checking PsJson Dep"
  }
  
  Process{
    Try{
      Invoke-PSBabushka 'PsJson-Installed'
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

#Install-PwrBldrPsJson

#>