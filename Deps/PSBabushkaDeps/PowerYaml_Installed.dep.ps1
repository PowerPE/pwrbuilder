#requires -version 3
<#
.SYNOPSIS
  PowerYaml Dep

.DESCRIPTION
  Defines PowerYaml Dependency

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
        -Name 'PowerYaml-Installed' `
        -Met { Get-Module -Name PowerYaml } `
        -Meet {
            Log-Write -LogPath $sLogFile -LineValue "Installing - PowerYaml (PwrBldr Modules)" 
            Install-Module PowerYaml
        }
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrPowerYaml{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Checking PowerYaml Dep"
  }
  
  Process{
    Try{
      Invoke-PSBabushka 'PowerYaml-Installed'
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

#Install-PwrBldrPowerYaml

#>