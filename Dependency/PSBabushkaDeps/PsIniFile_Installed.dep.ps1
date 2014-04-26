#requires -version 3
<#
.SYNOPSIS
  PsIniFile Dep

.DESCRIPTION
  Defines PsIniFile Dependency

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
        -Name 'PsIniFile-Installed' `
        -Met { Get-Module -Name PsIniFile } `
        -Meet { 
            Log-Write -LogPath $sLogFile -LineValue "Installing - PsIniFile (PwrBldr Modules)" 
            Install-Module PsIniFile
        }
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrPsIniFile{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Checking PsIniFile Dep"
  }
  
  Process{
    Try{
      Invoke-PSBabushka 'PsIniFile-Installed'
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

#Install-PwrBldrPsIniFile

#>