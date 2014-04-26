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
  Param([switch]$cli)
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
    Log-Write -LogPath $sLogFile -LineValue "PwrBuilder"
  }
  
  Process{
    Try{
        Initialize-PwrBldrCliSession
              

    }
    
    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "PwrBuilder - Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
      Log-Finish -LogPath $sLogFile
    }
  }
}

Function Initialize-PwrBldrCliSession {
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "Initialize PwrBldr Session (cli)"
  }
  
  Process{
    Try{
        if (-not (Test-Path "$PwrBldrModuleRoot\Session\pwrbldr.pssc")) {
            Log-Write -LogPath $sLogFile -LineValue "PwrBldr Session - Creating Session Configuration File"
            New-PSSessionConfigurationFile -Path "$PwrBldrModuleRoot\Session\pwrbldr.pssc" -SessionType Empty -LanguageMode NoLanguage
            Log-Write -LogPath $sLogFile -LineValue "Configuration File: $PwrBldrModuleRoot\Session\pwrbldr.pssc"
        } 
        
        Log-Write -LogPath $sLogFile -LineValue "Validating Configuration File"
        Test-PSSessionConfigurationFile "$PwrBldrModuleRoot\Session\pwrbldr.pssc"
        Log-Write -LogPath $sLogFile -LineValue "Validating Configuration File - Completed Successfully."
        
        Register-PSSessionConfiguration -Path "$PwrBldrModuleRoot\Session\pwrbldr.pssc" -Name PwrBldrSessionConfig -AccessMode Remote -Force

        New-PSSession -ConfigurationName PwrBldrSessionCOnfig -EnableNetworkAccess -Name PwrBldrRootSession -ApplicationName PwrBldr
        Enter-PSSession -Name PwrBldrRootSession
        
       
    }
    
    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "PwrBuilder Session (cli) - Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}
