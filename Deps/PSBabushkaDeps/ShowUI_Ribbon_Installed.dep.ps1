#requires -version 3
<#
.SYNOPSIS
  ShowUI_Ribbon Dep

.DESCRIPTION
  Defines ShowUI_Ribbon Dependency

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
        -Name 'ShowUI_Ribbon-Installed' `
        -Met { Get-Module -Name Ribbon } `
        -Meet {
            Log-Write -LogPath $sLogFile -LineValue "Installing - ShowUI_Ribbon (PwrBldr Modules)" 
            Install-Module -ModuleUrl http://github.com/PowerPE/Show-UI_Ribbon/zipball/master -ModuleName Ribbon
        }
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrShowUI_Ribbon{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Checking ShowUI_Ribbon Dep"
  }
  
  Process{
    Try{
      Invoke-PSBabushka 'ShowUI_Ribbon-Installed'
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

#Install-PwrBldrShowUI_Ribbon

#>