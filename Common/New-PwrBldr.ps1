#requires -version 3
<#
.SYNOPSIS
  New PwrBuilder
 
.DESCRIPTION
  Creates new PwrBuilder xml structure
   
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
  
Function New-PwrBldr{

  Param(
  )

  Begin{

    $ErrorActionPreference = "Continue"

    $pwrUserConfigPath = "$env:USERPROFILE\pwrbuilder\config.xml"

    if ((Test-Path $pwrUserConfigPath) -eq $false) {

        $configTemplate = @"
<pwrbldr version="0.1.0">
 <config>
 </config>
</pwrbldr>
"@ | Out-File $pwrUserConfigPath

    }

    [xml] $pwrUserConfig = Get-Content $pwrUserConfigPath

  }
  
  Process{
    Try{
    
       $pwrUserConfig | Write-Output
        
    }
    
    Catch{
      Break
    }
  }
  
  End{
    If($?){
    }
  }
}