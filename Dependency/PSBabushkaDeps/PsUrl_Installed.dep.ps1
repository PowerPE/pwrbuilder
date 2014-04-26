#requires -version 3
<#
.SYNOPSIS
  PsUrl Dep

.DESCRIPTION
  Defines PsUrl Dependency

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
        -Name 'PsUrl-Installed' `
        -Met { Get-Module -Name PsUrl } `
        -Meet {
            Log-Write -LogPath $sLogFile -LineValue "Installing - PsUrl (PwrBldr Modules)" 
            Install-Module PsUrl
        }
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrPsUrl{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Checking PsUrl Dep"
  }
  
  Process{
    Try{
      Invoke-PSBabushka 'PsUrl-Installed'
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

#Install-PwrBldrPsUrl

#>