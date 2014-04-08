#requires -version 3
<#
.SYNOPSIS
  PwrBuilder Invoke
 
.DESCRIPTION
  Launch PwrBuilder
   
.OUTPUTS
  Log file stored in $env:UserProfile\Pwrbuilder\log\
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 

#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
Function Invoke-PwrBldr{
  Param([switch]$cli, [switch]$dev)
#---------------------------------------------------------[Initialisations]--------------------------------------------------------
  $ErrorActionPreference = "SilentlyContinue"
 
#Dot Source required Function Libraries
  . "$PSScriptRoot\..\Diagnostic\Logging_Functions.ps1"
  . "$PSScriptRoot\..\Deps\Directories.dep.ps1"
       
#----------------------------------------------------------[Declarations]----------------------------------------------------------
 
#Script Version
  $sScriptVersion = "0.1"
 
#Log File Info
  $sLogPath = $env:USERPROFILE + "\PowerShell\PwrBuilder\log"
  $sLogName = "PwrBldr.log"
  $sLogFile = $sLogPath + "\" + $sLogName

  Begin{
    Log-Start -LogPath $sLogPath -LogName $sLogName -ScriptVersion $sScriptVersion
    Log-Write -LogPath $sLogFile -LineValue "Invoking PwrBuilder"
  }
  
  Process{
    Try{
        Install-PwrBldrDirectories
        switch ($cli)
            {
                $True {
                   $PwrBldrCliSession = Initialize-PwrBldrCliSession
                }

                $False {}
            }

    }
    
    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "Invoking PwrBuilder - Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
      Log-Finish -LogPath $sLogFile
    }
  }
}

Function Initialize-PwrBldrSession {
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Initialize PwrBldr Session"
  }
  
  Process{
    Try{
        switch ($cli)
            {
                $True {
                    Initialize-PwrBldrCliSession
                }

                $False {}
            }
       
    }
    
    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "Invoking PwrBuilder - Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}
#> 
