#requires -version 3
<#
.SYNOPSIS
  PwrBuilder PsGet
 
.DESCRIPTION
  PwrBuilder PsGet Installer
   
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrPsGet{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Checking PsGet Dep"
  }
  
  Process{
    Try{
      if(-not (Get-Module -Name PsGet)) {
        Log-Write -LogPath $sLogFile -LineValue "Installing - PsGet"
        (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
      }
      Log-Write -LogPath $sLogFile -LineValue "Importing - PsGet"
      Import-Module PsGet
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
 
#Install-PwrBldrPsGet

#>