#requires -version 3
<#
.SYNOPSIS
  PwrBuilder PsBabushka
 
.DESCRIPTION
  PwrBuilder PsBabushka Installer
   
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrPsBabushka{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Checking PsBabushka Dep"
  }
  
  Process{
    Try{
      if(-not (Get-Module -Name PsBabushka)) {
        Log-Write -LogPath $sLogFile -LineValue "Installing - PsBabushka (PwrBldr Modules)"
        Install-Module -ModuleUrl https://github.com/PowerPE/PSBabushka/archive/master.zip -ModuleName PsBabushka
      }
        Log-Write -LogPath $sLogFile -LineValue "Importing - PsBabushka (PwrBldr Modules)"
        Import-Module PsBabushka -DisableNameChecking
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
 
#Install-PwrBldrPsBabushka

#>