#requires -version 3
<#
.SYNOPSIS
  PwrBuilder 
 
.DESCRIPTION
  PwrBuilder PsBabushka Installer
   
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
      
#-----------------------------------------------------------[Functions]------------------------------------------------------------
  
 
Function Install-PwrBldrDeps{
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "PwrBuilder Deps"
  }
  
  Process{
    Try{
      . "$PSScriptRoot\PsGet_Installed.dep.ps1"
      . "$PSScriptRoot\PsBabushka_Installed.dep.ps1"
      Install-PwrBldrPsGet
      Install-PwrBldrPsBabushka
      . "$PSScriptRoot\PSBabushkaDeps\ShowUI_Installed.dep.ps1"
      . "$PSScriptRoot\PSBabushkaDeps\ShowUI_Ribbon_Installed.dep.ps1"
      . "$PSScriptRoot\PSBabushkaDeps\PsConfig_Installed.dep.ps1"
      . "$PSScriptRoot\PSBabushkaDeps\PsJson_Installed.dep.ps1"
      . "$PSScriptRoot\PSBabushkaDeps\PsWatch_Installed.dep.ps1"
      . "$PSScriptRoot\PSBabushkaDeps\PsUrl_Installed.dep.ps1"
      . "$PSScriptRoot\PSBabushkaDeps\PowerYaml_Installed.dep.ps1"
      . "$PSScriptRoot\PSBabushkaDeps\PsIniFile_Installed.dep.ps1"
      Invoke-PSBabushka 'ShowUI-Installed'
      Invoke-PSBabushka 'ShowUI_Ribbon-Installed'
      Invoke-PSBabushka 'PsConfig-Installed'
      Invoke-PSBabushka 'PsJson-Installed'
      Invoke-PSBabushka 'PsWatch-Installed'
      Invoke-PSBabushka 'PsUrl-Installed'
      Invoke-PSBabushka 'PowerYaml-Installed'
      Invoke-PSBabushka 'PsIniFile-Installed'
      
    }
    
    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "PwrBuilder Deps - Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}

#>